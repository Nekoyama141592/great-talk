import 'package:great_talk/core/lists.dart';

Map<String, dynamic> returnSearchToken(String searchTerm) {
  final searchWords = returnSearchWords(searchTerm);
  Map<String, dynamic> searchToken = {};
  for (final word in searchWords) {
    searchToken[word] = true;
  }
  return searchToken;
}
