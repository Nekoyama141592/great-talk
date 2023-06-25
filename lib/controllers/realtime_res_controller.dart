import 'dart:convert';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/date_converter.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/consts/env_keys.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/views/subscribe/subscribe_page.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealtimeResController extends GetxController {
  final messages = <types.Message>[].obs;
  final realtimeRes = "".obs;
  int chatCount = 0;
  late OpenAI openAI;
  late SharedPreferences prefs;
  @override
  void onInit() {
    openAI = OpenAI.instance.build(
        token: dotenv.get(EnvKeys.OPEN_AI_API_KEY.name),
        baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20)),
        enableLog: true);
    super.onInit();
  }

  // 与えられたinterlocutorとのチャット履歴を取得
  Future<void> getChatLog(types.User interlocutor) async {
    List<types.Message> a = await _getLocalMessages(interlocutor.id);
    await PurchasesController.to.restorePurchases(); // 購入内容を復元
    debugPrint("==========取得されました==========");
    messages(a);
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

  void onSendPressed(BuildContext context, types.User interlocutor,
      PersonsController controller, TextEditingController inputController) {
    FocusScope.of(context).unfocus();
    execute(interlocutor, controller, inputController.text);
    inputController.text = "";
  }

  Future<void> execute(types.User interlocutor, PersonsController controller,
      String content) async {
    final model = GptTurboChatModel();
    final request = ChatCompleteText(
        messages: [Messages(role: Role.user, content: content)],
        maxToken: 200,
        model: model);
        _addMessage(content, chatUiCurrrentUser);
    prefs = await SharedPreferences.getInstance();
    chatCount = _getChatCount(prefs); // 端末から今日のチャット回数を取得
    if (!_allowChat()) {
      // チャットが許されていない場合
      await _requestReview(); // レビューをリクエスト
      Get.to(const SubscribePage()); // サブスクのページに飛ばす
      return;
    }
    _addEmptyMessage(interlocutor); // Viewで表示できる要素数を一つ増やす
    realtimeRes(""); // realtimeResを初期化
    messages([...messages]); // messageを再代入して変更をViewに反映
    _listenToChatCompletionSSE(
        request, interlocutor, controller); // ChatGPTのリアルタイム出力
  }

  void _addEmptyMessage(types.User interlocutor) {
    messages.add(types.TextMessage(
      author: interlocutor,
      createdAt: DateConverter.nowDateTime(),
      id: randomString(),
      text: "",
    ));
  }

  void _listenToChatCompletionSSE(ChatCompleteText request,
      types.User interlocutor, PersonsController controller) {
    openAI.onChatCompletionSSE(request: request).listen((it) {
      final content = it.choices?.last.message?.content;
      if (content != null && content.isNotEmpty) {
        realtimeRes(realtimeRes.value + content);
        debugPrint(content);
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

  void _addMessage(String content,types.User author) {
    final textMessage = types.TextMessage(
      author: author,
      createdAt: DateConverter.nowDateTime(),
      id: randomString(),
      text: content,
    );
    messages.add(textMessage);
    messages([...messages]);
  }
}
