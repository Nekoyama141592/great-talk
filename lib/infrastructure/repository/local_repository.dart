import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:great_talk/core/exception/local_exception.dart';
import 'package:great_talk/core/extension/shared_preferences_extension.dart';
import 'package:great_talk/infrastructure/model/database_schema/text_message/text_message.dart';
import 'package:great_talk/infrastructure/model/local_schema/save_text_msg/save_text_msg.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:great_talk/domain/repository_interface/i_local_repository.dart';

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

class LocalRepository implements ILocalRepository {
  LocalRepository(this.prefs);
  final SharedPreferences prefs;

  List<T> _fetchList<T>(
    String keyName,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final jsonList = prefs.getJsonList(keyName) ?? [];
      return jsonList.map((e) {
        try {
          return fromJson(e);
        } catch (error) {
          debugPrint('_fetchList: JSON parse error for key "$keyName": $error');
          return null;
        }
      }).where((item) => item != null).cast<T>().toList();
    } on LocalException catch (e) {
      debugPrint('_fetchList: ${e.toString()}');
      return [];
    } catch (error) {
      debugPrint('_fetchList: Error accessing key "$keyName": $error');
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
    } on LocalException catch (e) {
      debugPrint('_addElement: ${e.toString()}');
      return Result.failure('追加が失敗しました: ${e.code}');
    } catch (error) {
      debugPrint('_addElement: Unexpected error - $error');
      throw LocalException.add(
        'Failed to add element for key "${key.name}": $error',
      );
    }
  }

  @override
  FutureResult<bool> addVerifiedPurchase(VerifiedPurchase value) {
    return _addElement(PrefsKey.verifiedPurchases, value.toJson());
  }

  @override
  List<VerifiedPurchase> fetchVerifiedPurchases() {
    return _fetchList(
      PrefsKey.verifiedPurchases.name,
      VerifiedPurchase.fromJson,
    );
  }

  @override
  FutureResult<bool> removeChatLog(String postId) async {
    try {
      await prefs.remove(postId);
      return const Result.success(true);
    } on LocalException catch (e) {
      debugPrint('removeChatLog: ${e.toString()}');
      return Result.failure('削除が失敗しました: ${e.code}');
    } catch (error) {
      debugPrint('removeChatLog: Unexpected error - $error');
      throw LocalException.remove(
        'Failed to remove chat log for postId "$postId": $error',
      );
    }
  }

  bool? _getBool(PrefsKey key) {
    try {
      return prefs.getBool(key.name);
    } on LocalException catch (e) {
      debugPrint('_getBool: ${e.toString()}');
      return null;
    } catch (error) {
      debugPrint('_getBool: Unexpected error - $error');
      throw LocalException.getBool(
        'Failed to get bool for key "${key.name}": $error',
      );
    }
  }

  String? _getString(String keyName) {
    try {
      return prefs.getString(keyName);
    } on LocalException catch (e) {
      debugPrint('_getString: ${e.toString()}');
      return null;
    } catch (error) {
      debugPrint('_getString: Unexpected error - $error');
      throw LocalException.getString(
        'Failed to get string for key "$keyName": $error',
      );
    }
  }

  Future<void> _setString(String keyName, String value) {
    try {
      return prefs.setString(keyName, value);
    } on LocalException catch (e) {
      debugPrint('_setString: ${e.toString()}');
      return Future.error('記録が失敗しました: ${e.code}');
    } catch (error) {
      debugPrint('_setString: Unexpected error - $error');
      throw LocalException.setString(
        'Failed to set string for key "$keyName": $error',
      );
    }
  }

  Future<void> _setBool(PrefsKey key, bool value) async {
    try {
      await prefs.setBool(key.name, value);
    } on LocalException catch (e) {
      debugPrint('_setBool: ${e.toString()}');
      rethrow;
    } catch (error) {
      debugPrint('_setBool: Unexpected error - $error');
      throw LocalException.setBool(
        'Failed to set bool for key "${key.name}": $error',
      );
    }
  }

  @override
  bool getIsDarkTheme() {
    return _getBool(PrefsKey.isDarkTheme) ?? true;
  }

  @override
  Future<void> setIsDarkTheme(bool value) {
    return _setBool(PrefsKey.isDarkTheme, value);
  }

  @override
  bool getNeedFirstMessage() {
    return _getBool(PrefsKey.needFirstMessage) ?? true;
  }

  @override
  Future<void> setNeedFirstMessage(bool value) {
    return _setBool(PrefsKey.needFirstMessage, value);
  }

  @override
  bool getIsAgreedToTerms() {
    return _getBool(PrefsKey.isAgreedToTerms) ?? false;
  }

  @override
  Future<void> setIsAgreedToTerms(bool value) {
    return _setBool(PrefsKey.isAgreedToTerms, value);
  }

  @override
  String? getImage(String fileName) {
    return _getString(fileName);
  }

  @override
  Future<void> setImage(String fileName, String value) {
    return _setString(fileName, value);
  }

  @override
  Future<void> setMessages(String postId, List<TextMessage> messages) {
    try {
      final objectList = messages.map(SaveTextMsg.fromTextMessage).toList();
      final value = jsonEncode(objectList);
      return _setString(postId, value);
    } catch (error) {
      debugPrint('setMessages: Serialization error - $error');
      throw LocalException.serialization(
        'Failed to serialize messages for postId "$postId": $error',
      );
    }
  }

  @override
  List<TextMessage> getMessages(String postId) {
    return _fetchList(
      postId,
      (e) => TextMessage.fromSaveTextMsg(SaveTextMsg.fromJson(e)),
    );
  }
}
