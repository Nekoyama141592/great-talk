import 'package:great_talk/controllers/docs_controller.dart';

abstract class SearchDocsController extends DocsController {
  SearchDocsController() : super(enablePullDown: false);
  String searchTerm = "";
  String firestoreSearchTerm = "";
}
