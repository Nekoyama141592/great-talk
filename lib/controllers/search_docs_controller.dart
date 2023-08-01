import 'package:great_talk/controllers/docs_controller.dart';

abstract class SearchDocsController extends DocsController {
  SearchDocsController({required this.isSearchUser})
      : super(enablePullDown: false, isUserDocs: isSearchUser);
  final bool isSearchUser;
  String searchTerm = "";
  String firestoreSearchTerm = "";
}
