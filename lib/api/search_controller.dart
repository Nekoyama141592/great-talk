import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/common/persons.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  static SearchController get to => Get.find<SearchController>();
  RxList<types.User> results = fullPersons.obs;

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