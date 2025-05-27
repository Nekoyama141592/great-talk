import 'dart:typed_data';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferencesExtension on SharedPreferences {
  Map<String, dynamic>? getJson(String key) {
    final jsonString = getString(key);
    if (jsonString == null) {
      return null;
    }
    final result = json.decode(jsonString) as Map<String, dynamic>;
    return result;
  }

  List<Map<String, dynamic>>? getJsonList(String key) {
    final jsonString = getString(key);
    if (jsonString == null) {
      return null;
    }
    final dynamics = json.decode(jsonString) as List<dynamic>;
    final result = dynamics.map((e) => e as Map<String, dynamic>).toList();
    return result;
  }

  Uint8List? getImage(String key) {
    final base64 = getString(key);
    if (base64 == null) {
      return null;
    }
    final result = base64Decode(base64);
    return result;
  }

  Future<void> setJson(String key, Map<String, dynamic> jsonData) async {
    final jsonString = json.encode(jsonData);
    await setString(key, jsonString);
  }

  Future<void> setJsonList(
      String key, List<Map<String, dynamic>> jsonList) async {
    final jsonString = json.encode(jsonList);
    await setString(key, jsonString);
  }

  Future<void> setImage(String key, Uint8List uint8list) async {
    final base64 = base64Encode(uint8list);
    await setString(key, base64);
  }
}
