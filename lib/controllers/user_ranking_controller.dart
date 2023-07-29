import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserRankingController extends DocsController {
  final _repository = FirestoreRepository();
  UserRankingController() : super(enablePullDown: false);
  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    refreshController.refreshCompleted();
    return;
  }

  @override
  Future<void> fetchDocs() async {
    final result = await _repository.getUsersByFollowerCount();
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final result = await _repository.getMoreUsersByFollowerCount(docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
    refreshController.loadComplete();
  }
}
