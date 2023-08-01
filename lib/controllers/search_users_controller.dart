import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/search_docs_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchUsersController extends SearchDocsController {
  SearchUsersController() : super(isSearchUser: true);
  @override
  Future<void> fetchDocs() async {
    firestoreSearchTerm = searchTerm;
    final result = await repository.searchUsers(firestoreSearchTerm);
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    if (searchTerm == firestoreSearchTerm) {
      final result = await repository.searchMoreUsers(searchTerm, docs.last);
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
