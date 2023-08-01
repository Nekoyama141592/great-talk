import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/search_docs_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchUserPostsController extends SearchDocsController {
  SearchUserPostsController() : super(isSearchUser: false);
  String _passiveUid() => Get.parameters['uid']!;
  @override
  Future<void> fetchDocs() async {
    firestoreSearchTerm = searchTerm;
    final result = await repository.searchUserPosts(_passiveUid(), searchTerm);
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    if (searchTerm == firestoreSearchTerm) {
      final result = await repository.searchMoreUserPosts(
          _passiveUid(), searchTerm, docs.last);
      result.when(success: (res) {
        docs(res);
      }, failure: () {
        UIHelper.showFlutterToast("データの取得に失敗しました");
      });
    } else {
      UIHelper.showFlutterToast("再検索を行ってください");
    }
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    refreshController.refreshCompleted();
  }
}
