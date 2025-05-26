import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUtility {
  static Future<void> setJson(
    String key,
    Map<String, dynamic> jsonData, {
    SharedPreferences? prefs,
  }) async {
    try {
      final usePrefs = prefs ?? await SharedPreferences.getInstance();
      final jsonString = json.encode(jsonData);
      await usePrefs.setString(key, jsonString);
    } catch (e) {
      debugPrint('Error setting JSON data: $e');
    }
  }

  static Future<Map<String, dynamic>?> getJson(
    String key, {
    SharedPreferences? prefs,
  }) async {
    try {
      final usePrefs = prefs ?? await SharedPreferences.getInstance();
      final jsonString = usePrefs.getString(key);
      if (jsonString != null) {
        final jsonData = json.decode(jsonString);
        return jsonData;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error getting JSON data: $e');
      return null;
    }
  }
}
