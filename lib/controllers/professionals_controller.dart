// dart
import 'dart:convert';
import 'package:get/get.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ProfessionalsController extends PersonsController {
  ProfessionalsController()
      : super(proPersons.obs, professionalsPrefsKey, proPersons);
  static ProfessionalsController get to => Get.find<ProfessionalsController>();
  // このoverrideはある程度経過すれば消す。
  @override
  void getLatestPersons(SharedPreferences prefs) {
    final String jsonString = prefs.getString(personsPrefsKey) ?? "";
    if (jsonString.isNotEmpty) {
      final List<dynamic> decodedJson = jsonDecode(jsonString);
      List<types.User> latestPersons =
          decodedJson.map((e) => types.User.fromJson(e)).toList();
      final ids = latestPersons.map((e) => e.id).toList();
      for (final pro in proPersons) {
        if (!ids.contains(pro.id)) latestPersons.add(pro);
      }
      results(latestPersons);
    }
  }
}
