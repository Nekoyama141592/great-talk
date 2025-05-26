import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MutePostsController extends DocsController {
  MutePostsController() : super(DocsType.mutePosts);

  @override
  Future<void> fetchDocs() async {
    if (createRequestPostIds().isEmpty) return;
    await super.fetchDocs();
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    if (createRequestPostIds().isEmpty) return;
    await super.onLoading(refreshController);
  }

  
}
