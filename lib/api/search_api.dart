import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/common/persons.dart';

class SearchApi {
  static List<types.User> search(String query) {
    return fullPersons.where((element) {
      final name = element.lastName!.toLowerCase();
      final id = element.id.toLowerCase().replaceAll(" ", "");
      return name.contains(query) || id.contains(query);
    }).toList();
  }
}