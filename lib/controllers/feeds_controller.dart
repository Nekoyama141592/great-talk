import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/timeline/timeline.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedsController extends DocsController {
  FeedsController() : super(enablePullDown: true);

  List<QDoc> _timelineDocs = [];
  FutureResult<List<QDoc>> _timelinesToPostsResult(List<QDoc> timelines) async {
    final postIds = timelines
        .map(
          (e) => Timeline.fromJson(e.data()).postId,
        )
        .toList();
    final posts = await repository.getTimelinePosts(postIds);
    return posts;
  }

  Future<void> _fetchPosts(List<QDoc> fetchedTimelines) async {
    final posts = await _timelinesToPostsResult(fetchedTimelines);
    posts.when(
        success: (res) => docs(res),
        failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  Future<void> _fetchNewPosts(List<QDoc> fetchedTimelines) async {
    final posts = await _timelinesToPostsResult(fetchedTimelines);
    posts.when(
        success: (res) => insertAllDocs(res),
        failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  Future<void> _fetchMorePosts(List<QDoc> fetchedTimelines) async {
    final posts = await _timelinesToPostsResult(fetchedTimelines);
    posts.when(
        success: (res) => addAllDocs(res),
        failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  @override
  Future<void> fetchDocs() async {
    final timelines = await repository.getTimelines(_userRef());
    timelines.when(
        success: (res) async {
          _timelineDocs = res;
          await _fetchPosts(res);
        },
        failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final timelines =
        await repository.getMoreTimelines(_userRef(), _timelineDocs.last);
    timelines.when(
        success: (res) async {
          _timelineDocs.addAll(res);
          await _fetchMorePosts(res);
        },
        failure: () => UIHelper.showErrorFlutterToast("データの取得に失敗しました"));
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    final timelines =
        await repository.getNewTimelines(_userRef(), _timelineDocs.first);
    timelines.when(
        success: (res) async {
          for (final timeline in res.reversed.toList()) {
            _timelineDocs.insert(0, timeline);
          }
          await _fetchNewPosts(res);
        },
        failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
    refreshController.refreshCompleted();
  }

  DocRef _userRef() => CurrentUserController.to.publicUser.value!.typedRef();
}
