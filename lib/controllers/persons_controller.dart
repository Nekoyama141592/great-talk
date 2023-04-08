// dart
import 'dart:convert';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/api/date_converter.dart';
import 'package:get/get.dart';
import 'package:great_talk/domain/chat_user_metadata/chat_user_metadata.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonsController extends GetxController {
  late SharedPreferences prefs;
  final RxList<types.User> results;
  final String personsPrefsKey;
  final List<types.User> initialPersons;
  final RxBool isSearching = false.obs;

  PersonsController(this.results, this.personsPrefsKey, this.initialPersons) {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    getLatestPersons(prefs);
  }

  Future<void> setLatestPersons(
      SharedPreferences prefs, types.User person, String lastAnswer) async {
    // 新たにmetadataを設定する.
    final int lastSeen = DateConverter.nowDateTime();
    final Map<String, dynamic> metadata =
        ChatUserMetadata(lastAnswer: lastAnswer).toJson();
    final newPerson = person.copyWith(metadata: metadata, lastSeen: lastSeen);
    // チャットした人物を上に持ってくる.
    final List<types.User> latestPersons = List.from(results);
    latestPersons.removeWhere((element) => element.id == person.id);
    latestPersons.insert(0, newPerson);
    results(latestPersons);
    final jsonString = jsonEncode(latestPersons).toString();
    await prefs.setString(personsPrefsKey, jsonString);
  }

  Future<void> cleanMetadata(types.User person) async {
    final List<types.User> x = List.from(results);
    x[x.indexOf(person)] = person.copyWith(metadata: null);
    results(x);
    final jsonString = jsonEncode(x).toString();
    await prefs.setString(personsPrefsKey, jsonString);
  }

  // search_controllerのoverrideを消して、privateにする。
  void getLatestPersons(SharedPreferences prefs) {
    final String jsonString = prefs.getString(personsPrefsKey) ?? "";
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      List<types.User> latestPersons =
          decodedJson.map((e) => types.User.fromJson(e)).toList();
      results(latestPersons);
    }
  }

  void search(String query) {
    if (query.isNotEmpty) {
      results.value = initialPersons.where((element) {
        final name = element.lastName!.toLowerCase();
        final id = element.id.toLowerCase().replaceAll(" ", "");
        return name.contains(query) || id.contains(query);
      }).toList();
    }
  }

  void reset() => results(initialPersons);
}
