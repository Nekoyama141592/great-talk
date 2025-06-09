import 'package:flutter/cupertino.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/extension/shared_preferences_extension.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  LocalRepository(this.prefs);
  final SharedPreferences prefs;

  List<T> _fetchList<T>(
    PrefsKey key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final keyName = key.name;
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
    return _fetchList(PrefsKey.verifiedPurchases, VerifiedPurchase.fromJson);
  }

  FutureResult<bool> removeChatLog(String postId) async {
    try {
      await prefs.remove(postId);
      return const Result.success(true);
    } catch(e) {
      debugPrint('removeChatLog: ${e.toString()}');
      return const Result.failure('削除が失敗しました');
    }
  }

  bool? _getBool(PrefsKey key) {
    try {
      return prefs.getBool(key.name);
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }
  String? _getString(String keyName) {
    try {
      return prefs.getString(keyName);
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }
  Future<void> _setString(String keyName,String value) {
    try {
      return prefs.setString(keyName,value);
    } catch(e) {
      debugPrint(e.toString());
      return Future.error('記録が失敗しました');
    }
  }
  Future<void> _setBool(PrefsKey key,bool value) async {
    try {
      await prefs.setBool(key.name,value);
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  bool getIsDarkTheme() {
    return _getBool(PrefsKey.isDarkTheme) ?? true;
  }
  Future<void> setIsDarkTheme(bool value) {
    return _setBool(PrefsKey.isDarkTheme,value);
  }
  bool getNeedFirstMessage() {
    return _getBool(PrefsKey.needFirstMessage) ?? true;
  }
  Future<void> setNeedFirstMessage(bool value) {
    return _setBool(PrefsKey.needFirstMessage,value);
  }
  bool getIsAgreedToTerms() {
    return _getBool(PrefsKey.isAgreedToTerms) ?? false;
  }
  Future<void> setIsAgreedToTerms(bool value) {
    return _setBool(PrefsKey.isAgreedToTerms,value);
  }

  String? getImage(String fileName) {
    return _getString(fileName);
  }
  Future<void> setImage(String fileName,String value) async {
    return _setString(fileName,value);
  }
}