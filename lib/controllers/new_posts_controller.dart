import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';

class NewPostsController extends DocsController {
  @override
  void setQuery() {
    query = QueryCore.postsByNewest();
  }
}
