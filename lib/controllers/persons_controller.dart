// dart
import 'dart:convert';
import 'package:great_talk/common/date_converter.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';
import 'package:great_talk/model/chat_user_metadata/chat_user_metadata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonsController extends GetxController {
  static PersonsController get to => Get.find<PersonsController>();
  late SharedPreferences prefs;
  final RxList<ChatUser> results = initialPeople.obs;
  final RxBool isSearching = false.obs;

  PersonsController() {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    getLatestPersons(prefs);
  }

  Future<void> setLatestPersons(ChatUser person, String lastAnswer) async {
    // 検索からチャットした場合は保存しない.
    if (isSearching.value) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    // 新たにmetadataを設定する.
    final int lastSeen = DateConverter.nowDateTime();
    final Map<String, dynamic> metadata =
        ChatUserMetadata(lastAnswer: lastAnswer).toJson();
    final newPerson = person.copyWith(metadata: metadata, lastSeen: lastSeen);
    // チャットした人物を上に持ってくる.
    final List<ChatUser> latestPersons = List.from(results);
    latestPersons.removeWhere((element) => element.uid == person.uid);
    latestPersons.insert(0, newPerson);
    results(latestPersons);
    final jsonString = jsonEncode(latestPersons).toString();
    await prefs.setString(initialPeoplePrefsKey, jsonString);
  }

  Future<void> cleanMetadata(ChatUser person) async {
    final List<ChatUser> x = List.from(results);
    x[x.indexOf(person)] = person.copyWith(metadata: null);
    results(x);
    final jsonString = jsonEncode(x).toString();
    await prefs.setString(initialPeoplePrefsKey, jsonString);
  }

  // search_controllerのoverrideを消して、privateにする。
  void getLatestPersons(SharedPreferences prefs) {
    final String jsonString = prefs.getString(initialPeoplePrefsKey) ?? "";
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      List<ChatUser> latestPersons =
          decodedJson.map((e) => ChatUser.fromJson(e)).toList();
      results(latestPersons);
    }
  }

  void search(String query) {
    if (query.isNotEmpty) {
      results.value = initialPeople.where((element) {
        final name = element.userName.toLowerCase();
        final id = element.uid.toLowerCase().replaceAll(" ", "");
        return name.contains(query) || id.contains(query);
      }).toList();
    }
  }

  void reset() => results(initialPeople);
}
