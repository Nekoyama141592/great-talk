import 'package:great_talk/consts/form_consts.dart';

class SearchCore {
  static Map<String, dynamic> returnSearchToken(String searchTerm) {
    final searchWords = returnSearchWords(searchTerm);
    Map<String, dynamic> searchToken = {};
    for (final word in searchWords) {
      searchToken[word] = true;
    }
    return searchToken;
  }

  static List<String> returnSearchWords(String searchTerm) {
    List<String> afterSplit = searchTerm.split('');
    afterSplit.removeWhere(
      (element) => FormConsts.notUseOnField.contains(element),
    );
    String result = '';
    for (final element in afterSplit) {
      final x = element.toLowerCase();
      result += x;
    }
    
    // Handle empty result after filtering
    if (result.isEmpty) {
      return [];
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
}
