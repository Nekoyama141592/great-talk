import 'package:great_talk/consts/form_consts.dart';

const List<String> notUseOnField = ['.', '[', ']', '*', '`'];
List<String> returnSearchWords(String searchTerm) {
  List<String> afterSplit = searchTerm.split('');
  afterSplit.removeWhere((element) => notUseOnField.contains(element));
  String result = '';
  for (final element in afterSplit) {
    final x = element.toLowerCase();
    result += x;
  }
  // bi-gram
  final int length = result.length;
  const nGramIndex = FormConsts.nGramIndex;
  List<String> searchWords = [];
  if (length < nGramIndex) {
    searchWords.add(result);
  } else {
    int termIndex = 0;
    for (int i = 0; i < length - nGramIndex + 1; i++) {
      final String word = result.substring(termIndex, termIndex + nGramIndex);
      searchWords.add(word);
      termIndex++;
    }
  }
  return searchWords;
}
