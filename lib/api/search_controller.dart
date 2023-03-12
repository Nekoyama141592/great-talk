// dart
import 'dart:convert';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/api/date_converter.dart';
import 'package:great_talk/common/persons.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/domain/chat_user_metadata.dart';
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

  Future<void> setLatestPersons(SharedPreferences prefs,types.User person,String lastAnswer) async {
    // 新たにmetadataを設定する.
    final int lastSeen = DateConverter.nowDateTime();
    final Map<String,dynamic> metadata = ChatUserMetadata(lastAnswer: lastAnswer, lastSeen: lastSeen).toJson();
    final newPerson = person.copyWith(metadata: metadata);
    // チャットした人物を上に持ってくる.
    final List<types.User> latestPersons = List.from(results);
    latestPersons.remove(person);
    latestPersons.insert(_startIndex, newPerson);
    results(latestPersons);
    final jsonString = jsonEncode(latestPersons).toString();
    await prefs.setString(localPersonsPrefsKey, jsonString);
  }

  Future<void> cleanMetadata(types.User person) async {
    final List<types.User> x = List.from(results);
    x[x.indexOf(person)] = person.copyWith(metadata: null);
    results(x);
    final jsonString = jsonEncode(x).toString();
    await prefs.setString(localPersonsPrefsKey, jsonString);
  }

  void _getLatestPersons(SharedPreferences prefs) {
    final String jsonString = prefs.getString(localPersonsPrefsKey) ?? "";
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