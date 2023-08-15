import 'dart:convert';
import 'dart:typed_data';

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
import 'package:great_talk/controllers/main_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/infrastructure/chat_gpt_api_client.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/save_text_msg/save_text_msg.dart';
import 'package:great_talk/model/text_message/text_message.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/repository/wolfram_repository.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealtimeResController extends GetxController with CurrentUserMixin {
  static RealtimeResController get to => Get.find<RealtimeResController>();
  final messages = <TextMessage>[].obs;
  final realtimeRes = "".obs;
  final isLoading = false.obs;
  final isGenerating = false.obs;
  int chatCount = 0;
  late SharedPreferences prefs;
  final Rx<ChatContent?> interlocutor = Rx(null);
  final Rx<Uint8List?> uint8list = Rx(null);
  final repository = FirestoreRepository();
  void _initState() {
    messages([]);
    realtimeRes('');
    isLoading(false);
    isGenerating(false);
    interlocutor(null);
  }
  // 与えられたinterlocutorとのチャット履歴を取得
  Future<void> getChatLog() async {
    _initState()
    prefs = MainController.to.prefs;
    isLoading(true);
    final uid = Get.parameters['uid']!;
    final postId = Get.parameters['postId']!;
    final type = returnIsOriginalContents(uid)
        ? InterlocutorType.originalContent
        : InterlocutorType.userContent;
    if (type == InterlocutorType.originalContent) {
      final res =
          originalContents.firstWhere((element) => element.contentId == postId);
      interlocutor(res);
    } else {
      final result = await repository.getPost(uid, postId);
      result.when(success: (res) async {
        if (res.exists) {
          final post = Post.fromJson(res.data()!);
          interlocutor(ChatContent.fromPost(post));
          final detectedImage = post.typedImage();
          final s3Image = await FileUtility.getS3Image(
              detectedImage.bucketName, detectedImage.value);
          uint8list(s3Image);
        } else {
          UIHelper.showFlutterToast("投稿が存在しません");
          return;
        }
      }, failure: () {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      });
    }
    List<TextMessage> a = _getLocalMessages();
    await PurchasesController.to.restorePurchases(); // 購入内容を復元
    messages(a);
    isLoading(false);
  }

  List<TextMessage> _getLocalMessages() {
    if (interlocutor.value == null) {
      return [];
    }
    final jsonString = prefs.getString(interlocutor.value!.contentId) ?? "";
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
      TextEditingController inputController,
      ScrollController scrollController) {
    final text = inputController.text;
    if (text.length > maxMessageLimit) {
      UIHelper.showErrorFlutterToast(
          "メッセージは${textLimitMsg(maxMessageLimit, text)}");
      return;
    }
    FocusScope.of(context).unfocus();
    execute(scrollController, text);
    inputController.text = "";
  }

  Future<void> execute(
      ScrollController scrollController, String content) async {
    final model = GptTurbo0631Model();
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
    final CustomCompleteText completeText =
        interlocutor.value!.managedCustomCompleteText();
    final request = ChatCompleteText(
      model: model,
      messages: requestMessages,
      temperature: completeText.temperature,
      topP: completeText.topP,
      maxToken: _adjustMaxToken(),
      presencePenalty: completeText.presencePenalty,
      frequencyPenalty: completeText.frequencyPenalty,
      user: currentUid(),
    );
    _listenToChatCompletionSSE(request, scrollController); // ChatGPTのリアルタイム出力
  }

  int _adjustMaxToken() => messages.length < 3 ? maxToken ~/ 2 : maxToken;

  void _addEmptyMessage() {
    messages.add(_newtTextMessage('', interlocutor.value!.contentId));
  }

  void _scrollToBottom(ScrollController scrollController) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  void _listenToChatCompletionSSE(
      ChatCompleteText request, ScrollController scrollController) {
    // 生成中なら何もしない
    if (isGenerating.value || interlocutor.value == null) {
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
      final completedMsg =
          _newtTextMessage(realtimeRes.value, interlocutor.value!.contentId);
      messages.last = completedMsg;
      messages([...messages]);
      isGenerating(false);
      _setValues();
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

  Future<void> _createTextMsgDoc(TextMessage message) async {
    // オリジナルコンテンツなら保存はしない
    if (!returnIsOriginalContents(interlocutor.value!.posterUid)) {
      final repository = FirestoreRepository();
      await repository.createMessage(
          message.typedMessageRef(), message.toJson());
    }
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

  Future<void> _setValues() async {
    if (interlocutor.value == null) {
      return;
    }
    await _setLocalMessage();
    await _setLocalDate();
    await _setChatCount();
  }

  Future<void> _setLocalMessage() async {
    if (interlocutor.value == null) {
      return;
    }
    final String interlocutorId = interlocutor.value!.contentId;
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

  TextMessage _newtTextMessage(String content, String senderUid) {
    final now = Timestamp.now();
    final id = randomString();
    final posterUid = interlocutor.value!.posterUid;
    final textMessage = TextMessage(
      createdAt: now,
      id: id,
      messageType: MessageType.text.name,
      messageRef: FirestoreQueries.postMessageDocRef(
          posterUid, interlocutor.value!.contentId, currentUid(), id),
      postRef: interlocutor.value!.typedRef(),
      text: NewContent.newDetectedText(content).toJson(),
      posterUid: posterUid,
      senderUid: senderUid,
    );
    return textMessage;
  }

  void _addMessage(String content) {
    final textMessage = _newtTextMessage(content, currentUid());
    messages.add(textMessage);
    messages([...messages]);
    _createTextMsgDoc(textMessage); // firestoreにメッセージを追加
  }

  Future<List<Messages>> _createRequestMessages(String content) async {
    if (interlocutor.value == null) {
      return [];
    }
    final id = interlocutor.value!.contentId;
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
        role: msg.senderUid == currentUid() ? Role.user : Role.assistant,
        content: msg.typedText().value);
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
    String content =
        interlocutor.value!.managedCustomCompleteText().systemPrompt;
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

  void onDescriptionButtonPressed() {
    if (interlocutor.value == null) {
      return;
    }
    UIHelper.simpleAlertDialog(
      interlocutor.value!.typedDescription().value,
    );
  }
  bool isMyContent(TextMessage message) {
    if (message.senderUid == currentUid()) return true;
    if (message.senderUid != interlocutor.value!.contentId) {
      return true;
    } else {
      return false;
    }
  }
}
