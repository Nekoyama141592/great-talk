import 'dart:async';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/model/view_model_state/posts/posts_state.dart';
import 'package:great_talk/providers/service/firestore/firestore_service_provider.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/usecase/posts/posts_use_case.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/typedef/firestore_typedef.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'docs_view_model.g.dart';

@riverpod
class DocsViewModel extends _$DocsViewModel {
  @override
  FutureOr<PostsState> build(DocsType type) {
    return _fetchData();
  }

  TokensNotifier _tokensNotifier() => ref.read(tokensNotifierProvider.notifier);
  TokensState _tokensState() =>
      ref.read(tokensNotifierProvider).value ?? TokensState();
  PostsUseCase get _useCase => ref.read(postsUseCaseProvider);
  FirestoreRepository get _repository => _useCase.repository;

  // Query
  MapQuery _setQuery() {
    final service = ref.read(firestoreServiceProvider);
    switch (type) {
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
      final posts = await _repository.getPosts(_setQuery());
      final newQDocInfoList = await _useCase.createUserPosts(posts);
      return PostsState(userPosts: newQDocInfoList);
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
      final lastPost = currentState.userPosts.last.post;
      final posts =
            await _repository.getMorePosts(_setQuery(),lastPost);
      final sorted = _useCase.sortedPosts(posts);
      _updateDocInfoList(sorted);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    } finally {
      refreshController.loadComplete();
    }
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

    final newQDocInfoList = await _useCase.createUserPosts(newElements);
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
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) {
      return const Result.failure('ログインしてください');
    }
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

    return await _repository.deleteMutePostInfo(
      currentUid,
      post,
      deleteToken.tokenId,
    );
  }
}
