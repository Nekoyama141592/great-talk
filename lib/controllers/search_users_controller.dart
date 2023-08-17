import 'package:great_talk/common/enums.dart';
import 'package:great_talk/controllers/abstract/search_docs_controller.dart';

class SearchUsersController extends SearchDocsController {
  SearchUsersController() : super(searchTarget: SearchTarget.user);
}
