import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostRankingController extends DocsController {
  PostRankingController() : super(enablePullDown: false);

  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    refreshController.refreshCompleted();
    return;
  }

  @override
  Future<void> fetchDocs() async {
    final result = await repository.getPostsByLikeCount();
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final result = await repository.getMorePostsByLikeCount(docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
    refreshController.loadComplete();
  }
}
