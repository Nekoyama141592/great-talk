import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/interfaces/more_docs_interface.dart';
import 'package:great_talk/model/timeline/timeline.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class HomeController extends DocsController implements MoreDocsInterface {
  final _repository = FirestoreRepository();
  List<QDoc> _timelineDocs = [];

  Future<void> _fetchPosts(List<QDoc> fetchedTimelines) async {
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

  Future<void> _fetchNewPosts(List<QDoc> fetchedTimelines) async {
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

  Future<void> _fetchMorePosts(List<QDoc> fetchedTimelines) async {
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

  @override
  Future<void> fetchDocs() async {
    if (_isWhereInQuery()) {
      final posts = await _repository.getPostsByFollowing(_followingUids());
      posts.when(
          success: (res) => docs(res),
          failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
    } else {
      final timelines = await _repository.getTimelines(_userRef());
      timelines.when(
          success: (res) async {
            _timelineDocs = res;
            await _fetchPosts(res);
          },
          failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
    }
  }

  @override
  Future<void> onLoading() async {
    if (_isWhereInQuery()) {
      final posts = await _repository.getMorePostsByFollowing(
          _followingUids(), docs.last);
      posts.when(
          success: (res) => addAllDocs(res),
          failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
    } else {
      final timelines =
          await _repository.getMoreTimelines(_userRef(), _timelineDocs.last);
      timelines.when(
          success: (res) async {
            _timelineDocs.addAll(res);
            await _fetchMorePosts(res);
          },
          failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
    }
  }

  @override
  Future<void> onRefresh() async {
    if (_isWhereInQuery()) {
      final posts = await _repository.getNewPostsByFollowing(
          _followingUids(), docs.first);
      posts.when(
          success: (res) => insertAllDocs(res),
          failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
    } else {
      final timelines =
          await _repository.getNewTimelines(_userRef(), _timelineDocs.first);
      timelines.when(
          success: (res) async {
            for (final timeline in res.reversed.toList()) {
              _timelineDocs.insert(0, timeline);
            }
            await _fetchNewPosts(res);
          },
          failure: () => UIHelper.showFlutterToast("データの取得に失敗しました"));
    }
  }

  DocRef _userRef() => CurrentUserController.to.firestoreUser.value!.typedRef();
  List<String> _followingUids() => CurrentUserController.to.followingUids;
  bool _isWhereInQuery() => _followingUids().length <= whereInLimit;
}
