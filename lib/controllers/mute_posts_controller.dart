import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MutePostsController extends DocsController {
  MutePostsController() : super(DocsType.mutePosts);
  @override
  MapQuery setQuery() {
    final requestPostIds = createRequestPostIds();
    return QueryCore.postsByWhereIn(requestPostIds);
  }

  @override
  Future<void> fetchDocs() async {
    final requestPostIds = createRequestPostIds();
    if (requestPostIds.isNotEmpty) {
      await super.fetchDocs();
    }
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final requestPostIds = createRequestPostIds();
    if (requestPostIds.isNotEmpty) {
      await super.onLoading(refreshController);
    }
  }

  
}
