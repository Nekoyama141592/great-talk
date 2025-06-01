import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/model/view_model_state/common/user_post/user_post.dart';
import 'package:great_talk/model/view_model_state/posts/posts_state.dart';
import 'package:great_talk/providers/service/firestore/firestore_service_provider.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/typedef/firestore_typedef.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/providers/usecase/file/file_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'docs_view_model.g.dart';

@riverpod
class DocsViewModel extends _$DocsViewModel {
  @override
  FutureOr<PostsState> build(DocsType type) {
    return _fetchData();
  }

  // DI
  String _currentUid() => ref.read(streamAuthUidProvider).value!;
  TokensNotifier _tokensNotifier() => ref.read(tokensNotifierProvider.notifier);
  TokensState _tokensState() =>
      ref.read(tokensNotifierProvider).value ?? TokensState();
  FirestoreRepository get _repository => ref.read(firestoreRepositoryProvider);

  // Query
  MapQuery _setQuery() {
    final service = ref.read(firestoreServiceProvider);
    switch (type) {
      // TODO: 分ける
      case DocsType.feeds:
        return service.timelinesQuery(_currentUid());
      // TODO: 分ける
      case DocsType.mutePosts:
        return service.postsByWhereIn(_createRequestPostIds());
      case DocsType.newPosts:
        return service.postsByNewest();
      case DocsType.rankingPosts:
        return service.postsByMsgCount();
    }
  }

  Future<PostsState> _fetchData() async {
    if ((type == DocsType.mutePosts && _createRequestPostIds().isEmpty)) {
      return PostsState();
    }
    try {
      if (type == DocsType.feeds) {
        final currentUid = ref.read(streamAuthUidProvider).value;
        if (currentUid == null) return PostsState();
        final timelines = await _repository.getTimelines(currentUid);
        print(timelines.length);
        final postIds = timelines.map((e) => e.postId).toList();
        final posts = await _timelinesToPostsResult(postIds);
        final userPosts = await _createUserPosts(posts);
        return PostsState(
          timelines: timelines,
          userPosts: userPosts,
        );
      } else {
        final posts = await _repository.getPosts(_setQuery());
        final newQDocInfoList = await _createUserPosts(posts);
        return PostsState(userPosts: newQDocInfoList);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return PostsState();
    }
  }

  Future<void> onLoading(RefreshController refreshController) async {
    if (state.isLoading) return;
    if ((type == DocsType.mutePosts && _createRequestPostIds().isEmpty) ||
        (state.value?.userPosts.isEmpty ?? true)) {
      refreshController.loadComplete();
      return;
    }

    final currentState = state.value!;
    try {
      if (type == DocsType.feeds) {
        await _onLoadingTimeline(refreshController);
      } else {
        final lastPost = currentState.userPosts.last.post;
        final posts =
            await _repository.getMorePosts(_setQuery(),lastPost);
        _updateDocInfoList(_sortedPosts(posts));
      }
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    } finally {
      refreshController.loadComplete();
    }
  }

  Future<void> _onLoadingTimeline(RefreshController refreshController) async {
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) return;
    final currentState = state.value!;
    final lastTimeline = currentState.timelines.last;
    final timelines = await _repository.getMoreTimelines(_setQuery(),currentUid,lastTimeline);
    final postIds = timelines.map((e) => e.postId).toList();
    final postResult = await _timelinesToPostsResult(postIds);
    final newUserPosts = await _createUserPosts(postResult);
    final userPost = [...currentState.userPosts,...newUserPosts];
    final newTimelines = [...currentState.timelines, ...timelines];
    state = AsyncValue.data(currentState.copyWith(timelines: newTimelines,userPosts: userPost));
  }

  Future<void> _updateDocInfoList(
    List<Post> posts, {
    bool front = false,
  }) async {
    if (state.isLoading || posts.isEmpty) return;
    final currentState = state.value!;
    final currentPosts = currentState.userPosts;
    final docIds = currentPosts.map((e) => e.post.postId).toSet();
    final newElements = posts.where((e) => !docIds.contains(e.postId)).toList();

    if (newElements.isEmpty) return;

    final newQDocInfoList = await _createUserPosts(newElements);
    if (front) {
      state = AsyncValue.data(
        currentState.copyWith(
          userPosts: [...newQDocInfoList.reversed, ...currentPosts],
        ),
      );
    } else {
      state = AsyncValue.data(
        currentState.copyWith(
          userPosts: [...currentPosts, ...newQDocInfoList],
        ),
      );
    }
  }

  Future<List<UserPost>> _createUserPosts(List<Post> posts) async {
    final sorted = _sortedPosts(posts);
    final uids = sorted.map((e) => e.uid).toList();
    final fetchedUsers = await _repository.getUsersByUids(uids);
    final userMap = {for (final user in fetchedUsers) user.uid: user};

    final newQDocInfoList = await Future.wait(
      sorted
          .where((element) {
            final uid = element.uid;
            return userMap.containsKey(uid);
          })
          .map((element) async {
            final publicUser = userMap[element.uid]!;
            final userImage = await _getImageFromDoc(element);
            return UserPost(
              user: publicUser,
              post:  element,
              base64:userImage != null ? base64Encode(userImage) : null,
            );
          }),
    );
    return newQDocInfoList;
  }

  List<Post> _sortedPosts(List<Post> posts) {
    return posts..sort((a, b) => (b.createdAt).compareTo(a.createdAt));
  }

  Future<Uint8List?> _getImageFromDoc(Post post) async {
    final detectedImage = post.typedImage();
    return ref
        .read(fileUseCaseProvider)
        .getS3Image(detectedImage.bucketName, detectedImage.value);
  }

  Future<List<Post>> _timelinesToPostsResult(List<String> postIds)  {
    return _repository.getTimelinePosts(postIds);
  }

  // Mute Post
  List<String> _createRequestPostIds() {
    final currentDocsLength = state.value?.userPosts.length ?? 0;
    final mutePostIds = _tokensState().mutePostIds;
    if (mutePostIds.length > currentDocsLength) {
      final remaining = mutePostIds.length - currentDocsLength;
      final limit = remaining >= whereInLimit ? whereInLimit : remaining;
      return mutePostIds.sublist(currentDocsLength, currentDocsLength + limit);
    }
    return [];
  }

  FutureResult<bool> onMutePostCardTap(Post post) async {
    final postId = post.postId;
    final deleteToken = _tokensState().mutePostTokens.firstWhere(
      (e) => e.postId == postId,
    );
    _tokensNotifier().removeMutePost(deleteToken);

    final newQDocInfoList =
        state.value!.userPosts
            .where((e) => e.post.postId != postId)
            .toList();
    state = AsyncValue.data(
      state.value!.copyWith(userPosts: newQDocInfoList),
    );
    final currentUid = _currentUid();

    return await _repository.deleteMutePostInfo(
      currentUid,
      post,
      deleteToken.tokenId,
    );
  }
}
