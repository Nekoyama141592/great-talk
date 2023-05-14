// dart
import 'dart:convert';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OriginalSearchController extends PersonsController {
  OriginalSearchController()
      : super(fullPersons.obs, localPersonsPrefsKey, fullPersons);
  static OriginalSearchController get to => Get.find<OriginalSearchController>();
  // このoverrideはある程度経過すれば消す。
  @override
  void getLatestPersons(SharedPreferences prefs) {
    final String jsonString = prefs.getString(personsPrefsKey) ?? "";
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      List<types.User> latestPersons =
          decodedJson.map((e) => types.User.fromJson(e)).toList();
      latestPersons.removeWhere(
        (element) => proPersons.map((e) => e.id).contains(element.id),
      );
      results(latestPersons);
    }
  }
}
