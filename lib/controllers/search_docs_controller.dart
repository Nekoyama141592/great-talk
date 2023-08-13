import 'package:great_talk/controllers/docs_controller.dart';

abstract class SearchDocsController extends DocsController {
  SearchDocsController({required this.isSearchUser})
      : super(enablePullDown: false, requiresValueReset: false);
  final bool isSearchUser;
  String searchTerm = "";
  String firestoreSearchTerm = "";
  void search(String value) async {
    searchTerm = value;
    await fetchDocs();
  }
}
