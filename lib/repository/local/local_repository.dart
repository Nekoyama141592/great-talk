import 'package:flutter/cupertino.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/extensions/shared_preferences_extension.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/providers/overrides/prefs/prefs_provider.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'local_repository.g.dart';

@riverpod
class LocalRepository extends _$LocalRepository {
  @override
  void build() {}

  SharedPreferences get _prefs => ref.read(prefsProvider);

  List<T> _fetchList<T>(
    PrefsKey key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final keyName = key.name;
      final jsonList = _prefs.getJsonList(keyName) ?? [];
      return jsonList.map((e) => fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  FutureResult<bool> _addElement(
    PrefsKey key,
    Map<String, dynamic> newElement,
  ) async {
    try {
      final keyName = key.name;
      final oldValue = _prefs.getJsonList(keyName) ?? [];
      final newValue = [...oldValue, newElement];
      await _prefs.setJsonList(keyName, newValue);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<bool> addVerifiedPurchase(VerifiedPurchase value) {
    return _addElement(PrefsKey.verifiedPurchases, value.toJson());
  }

  List<VerifiedPurchase> fetchVerifiedPurchases() {
    return _fetchList(PrefsKey.verifiedPurchases, VerifiedPurchase.fromJson);
  }
}
