import 'dart:convert';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:great_talk/common/date_converter.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/infrastructure/chat_gpt_api_client.dart';
import 'package:great_talk/repository/wolfram_repository.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealtimeResController extends GetxController {
  final messages = <types.Message>[].obs;
  final realtimeRes = "".obs;
  final isLoading = false.obs;
  bool isGenerating = false;
  int chatCount = 0;
  late SharedPreferences prefs;

  // 与えられたinterlocutorとのチャット履歴を取得
  Future<void> getChatLog(types.User interlocutor) async {
    isLoading(true);
    List<types.Message> a = await _getLocalMessages(interlocutor.id);
    await PurchasesController.to.restorePurchases(); // 購入内容を復元
    debugPrint("==========取得されました==========");
    messages(a);
    isLoading(false);
  }

  Future<List<types.Message>> _getLocalMessages(String interlocutorId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(interlocutorId) ?? "";
    List<types.Message> messages = [];
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      messages = decodedJson.map((e) => types.Message.fromJson(e)).toList();
    } else {
      messages = [];
    }
    return messages;
  }

  void onSendPressed(
      BuildContext context,
      types.User interlocutor,
      PersonsController controller,
      TextEditingController inputController,
      ScrollController scrollController) {
    FocusScope.of(context).unfocus();
    execute(interlocutor, controller, scrollController, inputController.text);
    inputController.text = "";
  }

  Future<void> execute(types.User interlocutor, PersonsController controller,
      ScrollController scrollController, String content) async {
    final model = GptTurboChatModel();
    prefs = await SharedPreferences.getInstance();
    chatCount = _getChatCount(prefs); // 端末から今日のチャット回数を取得
    if (!_allowChat()) {
      // チャットが許されていない場合
      await UIHelper.showFlutterToast(
          "チャットは1日$chatLimitPerDay回まで！\nサブスクに加入してください。");
      await _requestReview(); // レビューをリクエスト
      return;
    }
    _addMessage(content, chatUiCurrrentUser);
    _addEmptyMessage(interlocutor); // Viewで表示できる要素数を一つ増やす
    realtimeRes(""); // realtimeResを初期化
    messages([...messages]); // messageを再代入して変更をViewに反映
    // リクエストを作成
    final requestMessages = await _createRequestMessages(interlocutor, content);
    final request = ChatCompleteText(
        messages: requestMessages, maxToken: _adjustMaxToken(), model: model);
    _listenToChatCompletionSSE(request, interlocutor, controller,
        scrollController); // ChatGPTのリアルタイム出力
  }

  int _adjustMaxToken() {
    final x = messages.length < 3 ? maxToken ~/ 2 : maxToken;
    debugPrint("最大トークン数は$x !!!!!!!!!!!!!");
    debugPrint("長さは${messages.length} !!!!!!!!!!!!!");
    return x;
  }

  void _addEmptyMessage(types.User interlocutor) {
    messages.add(types.TextMessage(
      author: interlocutor,
      createdAt: DateConverter.nowDateTime(),
      id: randomString(),
      text: "",
    ));
  }

  void _scrollToBottom(ScrollController scrollController) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  void _listenToChatCompletionSSE(
      ChatCompleteText request,
      types.User interlocutor,
      PersonsController controller,
      ScrollController scrollController) {
    // 生成中なら何もしない
    if (isGenerating) {
      return;
    }
    isGenerating = true;
    final client = ChatGptApiClient();
    client.openAI.onChatCompletionSSE(request: request).listen((it) {
      final content = it.choices?.last.message?.content;
      if (content != null && content.isNotEmpty) {
        realtimeRes(realtimeRes.value + content);
        _scrollToBottom(scrollController);
      }
    }, onDone: () {
      messages.last = types.TextMessage(
        author: interlocutor,
        createdAt: DateConverter.nowDateTime(),
        id: randomString(),
        text: realtimeRes.value,
      );
      messages([...messages]);
      _setValues(interlocutor, controller);
      isGenerating = false;
    }, onError: (e) {
      chatCount--; // チャット数を一つ減らす
      _setChatCount(); // チャット数を保存
      messages.removeRange(
          messages.length - 2, messages.length); // うまく生成できなかったメッセージを削除
      messages([...messages]);
      UIHelper.showFlutterToast("文字数オーバーもしくはサーバーエラーで、値を取得できませんでした。");
      debugPrint("メッセージ生成時のエラー $e");
      isGenerating = false;
    });
  }

  int _getChatCount(SharedPreferences prefs) {
    int count = prefs.getInt(chatCountPrefsKey) ?? 0;
    // もし、最後のチャットから24時間経過していたらchatCountを0にして送信を許可
    if (_is24HoursFromLast(prefs)) {
      count = 0;
    }
    return count;
  }

  bool _is24HoursFromLast(SharedPreferences prefs) {
    final int last = prefs.getInt(lastChatDatePrefsKey) ?? 0;
    final lastDay = DateConverter.intToDateTime(last);
    final now = DateTime.now();
    return last == 0 ? true : DateConverter.isCrossingDate(lastDay, now);
  }

  bool _allowChat() {
    return chatCount < chatLimitPerDay ||
        PurchasesController.to.purchases.isNotEmpty;
  }

  Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    final isAvailable = await inAppReview.isAvailable();
    if (isAvailable) {
      await inAppReview.requestReview();
    }
  }

  Future<void> _setValues(
      types.User interlocutor, PersonsController controller) async {
    final String interlocutorId = interlocutor.id;
    await _setLocalMessage(interlocutorId);
    await _setLocalDate();
    await _setChatCount();
    await controller.setLatestPersons(interlocutor, realtimeRes.value);
  }

  Future<void> _setLocalMessage(String interlocutorId) async {
    final jsonString = jsonEncode(messages).toString();
    await prefs.setString(interlocutorId, jsonString);
  }

  Future<void> _setLocalDate() async {
    final dateInt = DateConverter.dateTimeToInt(DateTime.now());
    await prefs.setInt(lastChatDatePrefsKey, dateInt);
  }

  Future<void> _setChatCount() async {
    // 24時間経過していたらchatCountには0がくる
    chatCount++;
    await prefs.setInt(chatCountPrefsKey, chatCount);
  }

  void _addMessage(String content, types.User author) {
    final textMessage = types.TextMessage(
      author: author,
      createdAt: DateConverter.nowDateTime(),
      id: randomString(),
      text: content,
    );
    messages.add(textMessage);
    messages([...messages]);
  }

  Future<List<Messages>> _createRequestMessages(
      types.User interlocutor, String content) async {
    final id = interlocutor.id;
    switch (id) {
      case wolframId:
        final wolframRes = await WolframRepository.fetchApi(content);
        List<Messages> requestMessages = [];
        wolframRes.when(success: (res) {
          requestMessages = [
            Messages(role: Role.assistant, content: "わかりやすい日本語にして"),
            Messages(role: Role.user, content: res)
          ];
        }, failure: () {
          realtimeRes("計算AIから結果が得られなかったので普通のAIが対応します。\n\n");
          requestMessages = [Messages(role: Role.user, content: content)];
        });
        return requestMessages;
      case chatGPTId:
        return _toRequestMessages();
      default:
        final requestMessages = _toRequestMessages();
        requestMessages.insert(0, _systemMsg(interlocutor));
        return requestMessages;
    }
  }

  Messages _toRequestMessage(types.Message msg) {
    return Messages(
        role:
            msg.author.id == chatUiCurrrentUser.id ? Role.user : Role.assistant,
        content: msg.toJson()["text"]);
  }

  List<Messages> _toRequestMessages() {
    // メッセージからリクエストを送るJsonを生成.
    // メッセージ数を制限する。
    final requestMessages = messages.length > maxRequestLength
        ? messages.sublist(messages.length - maxRequestLength)
        : [...messages];
    final List<Messages> result =
        requestMessages.map((e) => _toRequestMessage(e)).toList();
    return result;
  }

  Messages _systemMsg(types.User interlocutor) {
    final name = interlocutor.lastName;
    String content = proIds.contains(interlocutor.id)
        ? "あなたは一人のプロの$nameです。それになりきって以下の問いに答えろ。自分がAIアシスタントだとは答えるな。"
        : "$nameになりきって$nameの口調で以下の問いに答えろ";
    content += attention;
    return Messages(role: Role.system, content: content);
  }

  void onCardLongTap() {
    if (PurchasesController.to.isSubscribing()) {
      return;
    } else {
      UIHelper.showFlutterToast("テキストをコピーするには有料プランを登録する必要があります");
      return;
    }
  }
}
