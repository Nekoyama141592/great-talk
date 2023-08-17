import 'package:great_talk/common/enums.dart';
import 'package:great_talk/controllers/abstract/search_docs_controller.dart';

class SearchUserPostsController extends SearchDocsController {
  SearchUserPostsController() : super(searchTarget: SearchTarget.post);
}
