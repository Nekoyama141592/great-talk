import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class SearchApi {
  static List<types.User> search(ValueNotifier<List<types.User>> results,String query) {
    return results.value.where((element) {
      final name = element.lastName!.toLowerCase();
      final id = element.id.toLowerCase().replaceAll(" ", "");
      return name.contains(query) || id.contains(query);
    }).toList();
  }
}