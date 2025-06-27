import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:great_talk/core/extension/shared_preferences_extension.dart';
import 'package:great_talk/infrastructure/model/database_schema/text_message/text_message.dart';
import 'package:great_talk/infrastructure/model/local_schema/save_text_msg/save_text_msg.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefsKey {
  // ${contentId}で各々のChat履歴
  // ${fileName}でキャッシュされた画像
  chatCountToday,
  initialPeople,
  isAgreedToTerms,
  isDarkTheme,
  isV3initialized,
  lastChatDate,
  latestReceipt,
  needFirstMessage,
  // Repository
  verifiedPurchases,
}

class LocalRepository {
  LocalRepository(this.prefs);
  final SharedPreferences prefs;

  List<T> _fetchList<T>(
    String keyName,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final jsonList = prefs.getJsonList(keyName) ?? [];
      return jsonList.map((e) => fromJson(e)).toList();
    } catch (e) {
      debugPrint('_fetchList: ${e.toString()}');
      return [];
    }
  }

  FutureResult<bool> _addElement(
    PrefsKey key,
    Map<String, dynamic> newElement,
  ) async {
    try {
      final keyName = key.name;
      final oldValue = prefs.getJsonList(keyName) ?? [];
      final newValue = [...oldValue, newElement];
      await prefs.setJsonList(keyName, newValue);
      return const Result.success(true);
    } catch (e) {
      debugPrint('_addElement: ${e.toString()}');
      return Result.failure('追加が失敗しました');
    }
  }

  FutureResult<bool> addVerifiedPurchase(VerifiedPurchase value) {
    return _addElement(PrefsKey.verifiedPurchases, value.toJson());
  }

  List<VerifiedPurchase> fetchVerifiedPurchases() {
    return _fetchList(
      PrefsKey.verifiedPurchases.name,
      VerifiedPurchase.fromJson,
    );
  }

  FutureResult<bool> removeChatLog(String postId) async {
    try {
      await prefs.remove(postId);
      return const Result.success(true);
    } catch (e) {
      debugPrint('removeChatLog: ${e.toString()}');
      return const Result.failure('削除が失敗しました');
    }
  }

  bool? _getBool(PrefsKey key) {
    try {
      return prefs.getBool(key.name);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  String? _getString(String keyName) {
    try {
      return prefs.getString(keyName);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> _setString(String keyName, String value) {
    try {
      return prefs.setString(keyName, value);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error('記録が失敗しました');
    }
  }

  Future<void> _setBool(PrefsKey key, bool value) async {
    try {
      await prefs.setBool(key.name, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool getIsDarkTheme() {
    return _getBool(PrefsKey.isDarkTheme) ?? true;
  }

  Future<void> setIsDarkTheme(bool value) {
    return _setBool(PrefsKey.isDarkTheme, value);
  }

  bool getNeedFirstMessage() {
    return _getBool(PrefsKey.needFirstMessage) ?? true;
  }

  Future<void> setNeedFirstMessage(bool value) {
    return _setBool(PrefsKey.needFirstMessage, value);
  }

  bool getIsAgreedToTerms() {
    return _getBool(PrefsKey.isAgreedToTerms) ?? false;
  }

  Future<void> setIsAgreedToTerms(bool value) {
    return _setBool(PrefsKey.isAgreedToTerms, value);
  }

  String? getImage(String fileName) {
    return _getString(fileName);
  }

  Future<void> setImage(String fileName, String value) {
    return _setString(fileName, value);
  }

  Future<void> setMessages(String postId, List<TextMessage> messages) {
    final objectList = messages.map(SaveTextMsg.fromTextMessage).toList();
    final value = jsonEncode(objectList);
    return _setString(postId, value);
  }

  List<TextMessage> getMessages(String postId) {
    return _fetchList(
      postId,
      (e) => TextMessage.fromSaveTextMsg(SaveTextMsg.fromJson(e)),
    );
  }
}
