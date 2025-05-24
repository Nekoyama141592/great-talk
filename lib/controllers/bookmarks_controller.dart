import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';

class BookmarksController extends DocsController {
  BookmarksController() : super();
  @override
  DocsType get type => DocsType.bookmarks;
}
