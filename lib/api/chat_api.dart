// dart
import 'dart:convert';
// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/api/chat_gpt_api.dart';
import 'package:great_talk/api/show_toast.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/routes.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  static Future<void> onSendPressed(BuildContext context,types.PartialText partialText,ValueNotifier<List<types.Message>> messages,types.User person) async {
    final prefs = await SharedPreferences.getInstance();
    int chatCount = _getChatCount(prefs);
    // もし、最後のチャットから24時間経過していたらchatCountを0にして送信を許可
    if (_is24HoursFromLast(prefs)) {
      chatCount = 0;
    }
    if (_allowChat(chatCount)) {
      final msg = partialText.text;
      _addMessage(msg,messages,chatUiCurrrentUser);
      final innerContext = ShowToast.showIndicator(context);
      await ChatGPTApi.fetchApi(messages.value,person).then((answerText) {
        _addMessage(answerText, messages, person);
        Navigator.pop(innerContext);
      });
      await _setValues(prefs,messages.value, person.id,chatCount);
    } else {
      toSubscribePage(context);
    }
  }

  static Future<void> _setValues(SharedPreferences prefs,List<types.Message> messages,String personId,int chatCount) async {
    await _setLocalMessage(prefs,messages,personId);
    await _setLocalDate(prefs);
    await _setChatCount(prefs,chatCount);
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

