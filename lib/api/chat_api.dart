// dart
import 'dart:convert';
// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// packages
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/api/chat_gpt_api.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/api/show_toast.dart';
import 'package:great_talk/api/wolfram_api.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/views/subscribe/subscribe_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_review/in_app_review.dart';
// common
import 'package:great_talk/common/strings.dart';
// api
import 'package:great_talk/api/date_converter.dart';
class ChatApi {
  static const chatLimitPerDay = 20;

  // 与えられたpersonとのチャット履歴を取得
  static Future<List<types.Message>> getChatLog(types.User person) async {
    List<types.Message> a = await _getLocalMessages(person.id);
    await PurchasesController.to.restorePurchases(); // 購入内容を復元
    debugPrint("==========取得されました==========");
    return a;
  }

  // 送信ボタンが押された時の処理
  static Future<void> onSendPressed(BuildContext context,types.PartialText partialText,ValueNotifier<List<types.Message>> messages,types.User person,PersonsController controller) async {
    final prefs = await SharedPreferences.getInstance();
    int chatCount = _getChatCount(prefs);
    final msg = partialText.text;
    // もし、最後のチャットから24時間経過していたらchatCountを0にして送信を許可
    if (_is24HoursFromLast(prefs)) {
      chatCount = 0;
    }
    // もう少しコードをきれいに整理する.
    if (_allowChat(chatCount)) {
      // 現在のユーザーのチャット.
      _addMessage(msg,messages,chatUiCurrrentUser);
      // ダイアログを表示.
      Get.dialog(const Center(child: CircularProgressIndicator(),));
      // 返答を生成.
      String answerText = "";
      switch (person.id) {
        case wolframId:
        // wolframの場合
        await WolframApi.fetchApi(msg).then((en) async {
          if (en == calculateFailedMsg) {
            final reqBody = ChatGPTApi.createBasicQuery(msg);
            await ChatGPTApi.fetchApi(reqBody).then((value) {
              answerText = "計算AIから結果が得られなかったので普通のAIが対応します。\n\n$value";
              _addMessageAndPop(answerText, messages, person);
            });
          } else {
            final reqBody = WolframApi.createChatGPTJaReqBody(en);
            await ChatGPTApi.fetchApi(reqBody).then((value) {
              answerText = value;
              _addMessageAndPop(answerText, messages, person);
            });
          }
        });
        break;
        default:
        final reqBody = ChatGPTApi.createGreatPeopleReqBody(messages.value, person);
        await ChatGPTApi.fetchApi(reqBody).then((value) {
          answerText = value;
          _addMessageAndPop(answerText, messages, person);
        });
        break;
      }
      await _setValues(prefs,messages.value, person,chatCount,answerText,controller);
    } else {
      // チャットが許されていない場合
      await _requestReview();
      Get.to(const SubscribePage());
    }
  }
  static Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    final isAvailable = await inAppReview.isAvailable();
    if (isAvailable) {
      await inAppReview.requestReview();
    }
  }
  static void _addMessageAndPop(String str,ValueNotifier<List<types.Message>> messages,types.User author) {
    _addMessage(str, messages, author);
    if(Get.isDialogOpen ?? true) {
      Get.back();
    }
  }
  static Future<void> _setValues(SharedPreferences prefs,List<types.Message> messages,types.User person,int chatCount,String lastAnswer,PersonsController controller) async {
    final String personId = person.id;
    await _setLocalMessage(prefs,messages,personId);
    await _setLocalDate(prefs);
    await _setChatCount(prefs,chatCount);
    await controller.setLatestPersons(prefs, person,lastAnswer);
  }

  static Future<void> _setLocalMessage(SharedPreferences prefs,List<types.Message> messages,String personId) async {
    final jsonString = jsonEncode(messages).toString();
    await prefs.setString(personId, jsonString);
  }

  static Future<void> _setLocalDate(SharedPreferences prefs) async {
    final dateInt = DateConverter.dateTimeToInt(DateTime.now());
    await prefs.setInt(lastChatDatePrefsKey, dateInt);
  }

  static Future<void> _setChatCount(SharedPreferences prefs,int chatCount) async {
    // 24時間経過していたらchatCountには0がくる
    await prefs.setInt(chatCountPrefsKey, chatCount + 1);
  }

  static int _getChatCount(SharedPreferences prefs) {
    return prefs.getInt(chatCountPrefsKey) ?? 0;
  }

  static Future<List<types.Message>> _getLocalMessages(String personId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(personId) ?? "";
    List<types.Message> messages = [];
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      messages = decodedJson.map((e) =>types.Message.fromJson(e)).toList();
    } else {
      messages = [];
    }
    return messages;
  }

  static void showCleanLocalMsgDialog(types.User person,PersonsController controller) {
    Get.dialog(CupertinoAlertDialog(
      content: const Text("履歴を全て削除しますがよろしいですか？"),
      actions: [
        CupertinoDialogAction(onPressed: Get.back,child: const Text('キャンセル')),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () async {
            await _cleanLocalMessage(person,controller);
            Get.back();
          },
          child: const Text("OK"))
      ],
    ));
  }
  static Future<void> _cleanLocalMessage(types.User person,PersonsController controller) async {
    final prefs = await SharedPreferences.getInstance();
    await controller.cleanMetadata(person);
    await prefs.remove(person.id);
    await ShowToast.showFlutterToast(clearChatMsg);
  }

  static bool _is24HoursFromLast(SharedPreferences prefs) {
    final int last = prefs.getInt(lastChatDatePrefsKey) ?? 0;
    final lastDay = DateConverter.intToDateTime(last);
    final now = DateTime.now();
    return last == 0 ? true : DateConverter.isCrossingDate(lastDay, now);
  }

  static bool _allowChat(int chatCount) {
    return chatCount < chatLimitPerDay || PurchasesController.to.purchases.isNotEmpty;
  }
  static void _addMessage(String str,ValueNotifier<List<types.Message>> messages,types.User author) {
    final textMessage = types.TextMessage(
      author: author,
      createdAt: DateConverter.nowDateTime(),
      id: randomString(),
      text: str,
    );
    messages.value = List.from(messages.value)..insert(0, textMessage);
  }
}


