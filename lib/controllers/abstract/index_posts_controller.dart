import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IndexPostsController extends DocsController {
  @override
  bool get enablePullDown => true;
  List<QDoc> indexDocs = [];

  FutureResult<List<QDoc>> _timelinesToPostsResult(
      List<QDoc> fetchedDocs) async {
    final List<String> postIds =
        fetchedDocs.map((e) => e.data()["postId"] as String).toList();
    final query = QueryCore.timelinePosts(postIds);
    final posts = await repository.getDocs(query);
    return posts;
  }

  Future<void> _fetchPosts(List<QDoc> fetchedTimelines) async {
    final posts = await _timelinesToPostsResult(fetchedTimelines);
    posts.when(
        success: (res) => addAllDocs(sortedDocs(res)),
        failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  Future<void> _fetchMorePosts(List<QDoc> fetchedTimelines) async {
    final posts = await _timelinesToPostsResult(fetchedTimelines);
    posts.when(
        success: (res) => addAllDocs(sortedDocs(res)),
        failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  @override
  Future<void> fetchDocs() async {
    if (CurrentUserController.to.isNotVerified()) return;
    try {
      final result = await query.get();
      indexDocs = result.docs;
      await _fetchPosts(result.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    if (CurrentUserController.to.isNotVerified()) return;
    try {
      final result = await query.startAfterDocument(indexDocs.last).get();
      indexDocs.addAll(result.docs);
      await _fetchMorePosts(result.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
    refreshController.loadComplete();
  }
}
