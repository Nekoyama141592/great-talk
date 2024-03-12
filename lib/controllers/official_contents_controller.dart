import 'package:great_talk/common/persons.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';

class OfficialContentsController extends DocsController {
  @override
  void setQuery() {
    query = QueryCore.userPosts(officialUid);
  }
}
