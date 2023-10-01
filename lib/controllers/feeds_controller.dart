import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/index_posts_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FeedsController extends IndexPostsController {
  FeedsController() : super();
  static FeedsController get to => Get.find<FeedsController>();

  @override
  void setQuery() {
    query = FirestoreQueries.timelinesQuery(_userRef());
  }

  // FutureResult<List<QDoc>> _timelinesToPostsResult(List<QDoc> timelines) async {
  //   final postIds = timelines
  //       .map(
  //         (e) => Timeline.fromJson(e.data()).postId,
  //       )
  //       .toList();
  //   final posts = await repository.getTimelinePosts(postIds);
  //   return posts;
  // }

  // Future<void> _fetchPosts(List<QDoc> fetchedTimelines) async {
  //   final posts = await _timelinesToPostsResult(fetchedTimelines);
  //   posts.when(
  //       success: (res) => setAllDocs(sortedDocs(res)),
  //       failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  // }

  // Future<void> _fetchMorePosts(List<QDoc> fetchedTimelines) async {
  //   final posts = await _timelinesToPostsResult(fetchedTimelines);
  //   posts.when(
  //       success: (res) => addAllDocs(sortedDocs(res)),
  //       failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  // }

  // @override
  // Future<void> fetchDocs() async {
  //   if (CurrentUserController.to.isNotVerified()) return;
  //   final timelines = await repository.getTimelines(_userRef());
  //   timelines.when(
  //       success: (res) async {
  //         _timelineDocs = res;
  //         await _fetchPosts(res);
  //       },
  //       failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  // }

  // @override
  // Future<void> onLoading(RefreshController refreshController) async {
  //   if (CurrentUserController.to.isNotVerified()) return;
  //   final timelines =
  //       await repository.getMoreTimelines(_userRef(), _timelineDocs.last);
  //   timelines.when(
  //       success: (res) async {
  //         _timelineDocs.addAll(res);
  //         await _fetchMorePosts(res);
  //       },
  //       failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  //   refreshController.loadComplete();
  // }

  DocRef _userRef() => FirestoreQueries.userDocRef(currentUid());
}
