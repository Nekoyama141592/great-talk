import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class NewPostsController extends DocsController {
  @override
  DocsType get type => DocsType.newPosts;
  @override
  MapQuery setQuery() {
    return QueryCore.postsByNewest();
  }
}
