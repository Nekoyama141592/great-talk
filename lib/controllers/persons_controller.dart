// dart
import 'dart:convert';
import 'package:great_talk/common/date_converter.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/chat_user_metadata/chat_user_metadata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonsController extends GetxController {
  static PersonsController get to => Get.find<PersonsController>();
  late SharedPreferences prefs;
  final RxList<ChatContent> results = originalContents.obs;
  final RxBool isSearching = false.obs;

  PersonsController() {
    init();
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    getLatestPersons(prefs);
  }

  Future<void> setLatestPersons(ChatContent person, String lastAnswer) async {
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
    final List<ChatContent> latestPersons = List.from(results);
    latestPersons
        .removeWhere((element) => element.contentId == person.contentId);
    latestPersons.insert(0, newPerson);
    results(latestPersons);
    final jsonString = jsonEncode(latestPersons).toString();
    await prefs.setString(PrefsKey.initialPeople.name, jsonString);
  }

  Future<void> cleanMetadata(ChatContent person) async {
    final List<ChatContent> x = List.from(results);
    x[x.indexOf(person)] = person.copyWith(metadata: null);
    results(x);
    final jsonString = jsonEncode(x).toString();
    await prefs.setString(PrefsKey.initialPeople.name, jsonString);
  }

  // search_controllerのoverrideを消して、privateにする。
  void getLatestPersons(SharedPreferences prefs) {
    final String jsonString =
        prefs.getString(PrefsKey.initialPeople.name) ?? "";
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      List<ChatContent> latestPersons =
          decodedJson.map((e) => ChatContent.fromJson(e)).toList();
      results(latestPersons);
    }
  }

  void search(String searchTerm) {
    if (searchTerm.isNotEmpty) {
      results.value = originalContents.where((element) {
        final name = element.title.toLowerCase();
        final id = element.contentId.toLowerCase();
        return name.contains(searchTerm) || id.contains(searchTerm);
      }).toList();
    }
  }

  void reset() => results(originalContents);
}
