// dart
import 'dart:convert';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/common/persons.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController{

  static SearchController get to => Get.find<SearchController>();
  late SharedPreferences prefs;
  RxList<types.User> results = fullPersons.obs;
  // 最新のChatした人をおくindex
  static const int _startIndex = 2;

  SearchController() {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    _getLatestPersons(prefs);
  }

  Future<void> setLatestPersons(SharedPreferences prefs,types.User person) async {
    final List<types.User> latestPersons = List.from(results)..remove(person)..insert(_startIndex, person);
    results(latestPersons);
    final jsonString = jsonEncode(latestPersons).toString();
    await prefs.setString(latestPersonsPrefsKey, jsonString);
  }

  void _getLatestPersons(SharedPreferences prefs) {
    final String jsonString = prefs.getString(latestPersonsPrefsKey) ?? "";
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      List<types.User> latestPersons = decodedJson.map((e) => types.User.fromJson(e) ).toList();
      results(latestPersons);
    }
    
  }


  void search(String query) {
    if (query.isNotEmpty) {
      results.value = fullPersons.where((element) {
        final name = element.lastName!.toLowerCase();
        final id = element.id.toLowerCase().replaceAll(" ", "");
        return name.contains(query) || id.contains(query);
      }).toList();
    }
  }

  void reset() => results(fullPersons);


}