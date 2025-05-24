import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IndexPostsController extends DocsController {
  FutureResult<List<QDoc>> _timelinesToPostsResult(
      List<QDoc> fetchedDocs) async {
    final repository = FirestoreRepository();
    final List<String> postIds =
        fetchedDocs.map((e) => e.data()["postId"] as String).toList();
    final query = QueryCore.timelinePosts(postIds);
    final posts = await repository.getDocs(query);
    return posts;
  }

  Future<void> _fetchTimelinePosts(List<QDoc> fetchedTimelines) async {
    final posts = await _timelinesToPostsResult(fetchedTimelines);
    posts.when(
        success: (res) => addAllDocs(sortedDocs(res)),
        failure: (e) => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  Future<void> _fetchMoreTimelinePosts(List<QDoc> fetchedTimelines) async {
    final posts = await _timelinesToPostsResult(fetchedTimelines);
    posts.when(
        success: (res) => addAllDocs(sortedDocs(res)),
        failure: (e) => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  @override
  Future<void> fetchDocs() async {
    if (CurrentUserController.to.isNotVerified()) return;
    try {
      final result = await setQuery().get();
      indexDocs = result.docs;
      await _fetchTimelinePosts(result.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    if (CurrentUserController.to.isNotVerified()) return;
    try {
      final result = await setQuery().startAfterDocument(indexDocs.last).get();
      indexDocs.addAll(result.docs);
      await _fetchMoreTimelinePosts(result.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
    refreshController.loadComplete();
  }
}
