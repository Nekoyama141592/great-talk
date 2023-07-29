import 'dart:convert';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/date_converter.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/infrastructure/chat_gpt_api_client.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/save_text_msg/save_text_msg.dart';
import 'package:great_talk/model/text_message/text_message.dart';
import 'package:great_talk/repository/wolfram_repository.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealtimeResController extends GetxController with CurrentUidMixin {
  final messages = <TextMessage>[].obs;
  final realtimeRes = "".obs;
  final isLoading = false.obs;
  final isGenerating = false.obs;
  int chatCount = 0;
  late SharedPreferences prefs;
  late ChatUser interlocutor;
  // 与えられたinterlocutorとのチャット履歴を取得
  Future<void> getChatLog(ChatUser value) async {
    interlocutor = value;
    isLoading(true);
    List<TextMessage> a = await _getLocalMessages();
    await PurchasesController.to.restorePurchases(); // 購入内容を復元
    debugPrint("==========取得されました==========");
    messages(a);
    isLoading(false);
  }

  Future<List<TextMessage>> _getLocalMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(interlocutor.uid) ?? "";
    List<TextMessage> messages = [];
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      final saveTextMsgs =
          decodedJson.map((e) => SaveTextMsg.fromJson(e)).toList();
      messages =
          saveTextMsgs.map((e) => TextMessage.fromSaveTextMsg(e)).toList();
    } else {
      messages = [];
    }
    return messages;
  }

  void onSendPressed(
      BuildContext context,
      PersonsController controller,
      TextEditingController inputController,
      ScrollController scrollController) {
    FocusScope.of(context).unfocus();
    execute(controller, scrollController, inputController.text);
    inputController.text = "";
  }

  Future<void> execute(PersonsController controller,
      ScrollController scrollController, String content) async {
    final model = GptTurboChatModel();
    prefs = await SharedPreferences.getInstance();
    chatCount = _getChatCount(); // 端末から今日のチャット回数を取得
    if (!_allowChat()) {
      // チャットが許されていない場合
      await UIHelper.showFlutterToast(
          "チャットは1日$chatLimitPerDay回まで！\nサブスクに加入してください。");
      await _requestReview(); // レビューをリクエスト
      return;
    }
    _addMessage(content);
    _addEmptyMessage(); // Viewで表示できる要素数を一つ増やす
    realtimeRes(""); // realtimeResを初期化
    messages([...messages]); // messageを再代入して変更をViewに反映
    // リクエストを作成
    final requestMessages = await _createRequestMessages(content);
    final request = ChatCompleteText(
        messages: requestMessages, maxToken: _adjustMaxToken(), model: model);
    _listenToChatCompletionSSE(
        request, controller, scrollController); // ChatGPTのリアルタイム出力
  }

  int _adjustMaxToken() => messages.length < 3 ? maxToken ~/ 2 : maxToken;

  void _addEmptyMessage() {
    final now = Timestamp.now();
    final id = randomString();
    messages.add(TextMessage(
      createdAt: now,
      id: id,
      messageType: MessageType.text.name,
      text: const DetectedText(
          languageCode: '',
          negativeScore: 0.0,
          positiveScore: 0.0,
          sentiment: '',
          value: ''),
      uid: currentUid(),
      updatedAt: now,
    ));
  }

  void _scrollToBottom(ScrollController scrollController) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  void _listenToChatCompletionSSE(ChatCompleteText request,
      PersonsController controller, ScrollController scrollController) {
    // 生成中なら何もしない
    if (isGenerating.value) {
      return;
    }
    isGenerating(true);
    final client = ChatGptApiClient();
    client.openAI.onChatCompletionSSE(request: request).listen((it) {
      final content = it.choices?.last.message?.content;
      if (content != null && content.isNotEmpty) {
        realtimeRes(realtimeRes.value + content);
        _scrollToBottom(scrollController);
      }
    }, onDone: () {
      final now = Timestamp.now();
      final id = randomString();
      messages.last = TextMessage(
        createdAt: now,
        id: id,
        messageType: MessageType.text.name,
        text: DetectedText(
            languageCode: '',
            negativeScore: 0.0,
            positiveScore: 0.0,
            sentiment: '',
            value: realtimeRes.value),
        uid: interlocutor.uid,
        updatedAt: now,
      );
      messages([...messages]);
      _setValues(controller);
      isGenerating(false);
    }, onError: (e) {
      chatCount--; // チャット数を一つ減らす
      _setChatCount(); // チャット数を保存
      messages.removeRange(
          messages.length - 2, messages.length); // うまく生成できなかったメッセージを削除
      messages([...messages]);
      UIHelper.showFlutterToast("文字数オーバーもしくはサーバーエラーで、値を取得できませんでした。");
      debugPrint("メッセージ生成時のエラー $e");
      isGenerating(false);
    });
  }

  int _getChatCount() {
    int count = prefs.getInt(PrefsKey.chatCount.name) ?? 0;
    // もし、最後のチャットから24時間経過していたらchatCountを0にして送信を許可
    if (_is24HoursFromLast()) {
      count = 0;
    }
    return count;
  }

  bool _is24HoursFromLast() {
    final int last = prefs.getInt(PrefsKey.lastChatDate.name) ?? 0;
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

  Future<void> _setValues(PersonsController controller) async {
    await _setLocalMessage();
    await _setLocalDate();
    await _setChatCount();
    await controller.setLatestPersons(interlocutor, realtimeRes.value);
  }

  Future<void> _setLocalMessage() async {
    final String interlocutorId = interlocutor.uid;
    final objectList =
        messages.map((e) => SaveTextMsg.fromTextMessage(e)).toList();
    final jsonString = jsonEncode(objectList);
    await prefs.setString(interlocutorId, jsonString);
  }

  Future<void> _setLocalDate() async {
    final dateInt = DateConverter.dateTimeToInt(DateTime.now());
    await prefs.setInt(PrefsKey.lastChatDate.name, dateInt);
  }

  Future<void> _setChatCount() async {
    // 24時間経過していたらchatCountには0がくる
    chatCount++;
    await prefs.setInt(PrefsKey.chatCount.name, chatCount);
  }

  void _addMessage(String content) {
    final now = Timestamp.now();
    final id = randomString();
    final textMessage = TextMessage(
      createdAt: now,
      id: id,
      messageType: MessageType.text.name,
      text: DetectedText(
          languageCode: '',
          negativeScore: 0.0,
          positiveScore: 0.0,
          sentiment: '',
          value: content),
      uid: currentUid(),
      updatedAt: now,
    );
    messages.add(textMessage);
    messages([...messages]);
  }

  Future<List<Messages>> _createRequestMessages(String content) async {
    final id = interlocutor.uid;
    switch (id) {
      case wolframId:
        final wolframRes = await WolframRepository.fetchApi(content);
        List<Messages> requestMessages = [];
        wolframRes.when(success: (res) {
          requestMessages = [
            Messages(role: Role.system, content: "わかりやすい日本語にして下さい。"),
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
        requestMessages.insert(0, _systemMsg());
        return requestMessages;
    }
  }

  Messages _toRequestMessage(TextMessage msg) {
    return Messages(
        role: msg.uid == currentUid() ? Role.user : Role.assistant,
        content: msg.text.value);
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

  Messages _systemMsg() {
    final name = interlocutor.userName;
    String content = proIds.contains(interlocutor.uid)
        ? "あなたは一人のプロの$nameです。それになりきって以下の問いに答えて下さい。自分がAIアシスタントだとは答えないで下さい。"
        : "$nameになりきって$nameの口調で以下の問いに答えてください。";
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
