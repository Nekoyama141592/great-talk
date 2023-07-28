import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/interfaces/more_docs_interface.dart';
import 'package:great_talk/model/timeline/timeline.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class HomeController extends DocsController implements MoreDocsInterface {
  final _repository = FirestoreRepository();
  List<QDoc> _timelineDocs = [];

  Future<void> fetchPosts(List<QDoc> fetchedTimelines) async {
    final postIds = fetchedTimelines
        .map(
          (e) => Timeline.fromJson(e.data()).postId,
        )
        .toList();
    final posts = await _repository.getTimelinePosts(postIds);
    posts.when(
        success: (res) => addAllDocs(res),
        failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
  }

  Future<void> fetchNewPosts(List<QDoc> fetchedTimelines) async {
    final postIds = fetchedTimelines
        .map(
          (e) => Timeline.fromJson(e.data()).postId,
        )
        .toList();
    final posts = await _repository.getTimelinePosts(postIds);
    posts.when(
        success: (res) => insertAllDocs(res),
        failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
  }

  Future<void> fetchMorePosts(List<QDoc> fetchedTimelines) async {
    final postIds = fetchedTimelines
        .map(
          (e) => Timeline.fromJson(e.data()).postId,
        )
        .toList();
    final posts = await _repository.getTimelinePosts(postIds);
    posts.when(
        success: (res) => docs(res),
        failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
  }

  @override
  Future<void> fetchDocs() async {
    final result = await _repository.getTimelines(userRef);
    result.when(
        success: (res) async {
          _timelineDocs = res;
          await fetchPosts(res);
        },
        failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
  }

  @override
  Future<void> onLoading() async {
    final result =
        await _repository.getMoreTimelines(userRef, _timelineDocs.last);
    result.when(
        success: (res) async {
          _timelineDocs.addAll(res);
          await fetchNewPosts(res);
        },
        failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
  }

  @override
  Future<void> onRefresh() async {
    final result =
        await _repository.getNewTimelines(userRef, _timelineDocs.first);
    result.when(
        success: (res) async {
          for (final timeline in res.reversed.toList()) {
            _timelineDocs.insert(0, timeline);
          }
          await fetchMorePosts(res);
        },
        failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
  }
}
