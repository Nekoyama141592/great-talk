import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';

class NewPostsController extends DocsController {
  NewPostsController()
      : super(enablePullDown: false, requiresValueReset: false);
  @override
  void setQuery() {
    query = FirestoreQueries.postsQueryByNewest;
  }
}
