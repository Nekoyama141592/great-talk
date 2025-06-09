import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/model/view_model_state/posts/posts_state.dart';
import 'package:great_talk/providers/global/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/usecase/posts/posts_use_case.dart';
import 'package:great_talk/providers/view_model/refresh_interface.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mute_posts_view_model.g.dart';

@riverpod
class MutePostsViewModel extends _$MutePostsViewModel implements RefreshInterface {
  PostsUseCase get _useCase => ref.read(postsUseCaseProvider);
  DatabaseRepository get _repository => _useCase.repository;
  TokensNotifier _tokensNotifier() => ref.read(tokensNotifierProvider.notifier);
  TokensState _tokensState() =>
      ref.read(tokensNotifierProvider).value ?? TokensState();
  @override
  FutureOr<PostsState> build() => _fetchData();

  Future<PostsState> _fetchData() async {
    final postIds = _createRequestPostIds();
    final posts = await _repository.getMutePosts(postIds);
    final userPosts = await _useCase.createUserPosts(posts);
    return PostsState(userPosts: userPosts);
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
  @override
  FutureResult<bool> onLoading() async {
    final currentState = state.value!;
    final lastPost = currentState.userPosts.last.post;
    final posts =
          await _repository.getMoreMutePosts(_createRequestPostIds(), lastPost);
    final sorted = _useCase.sortedPosts(posts);
    _addPosts(sorted);
    return const Result.success(true);
  }
  Future<void> _addPosts(List<Post> posts) async {
    if (state.isLoading || posts.isEmpty) return;
    final currentState = state.value!;
    final currentPosts = currentState.userPosts;
    final docIds = currentPosts.map((e) => e.post.postId).toSet();
    final newElements = posts.where((e) => !docIds.contains(e.postId)).toList();

    final newQDocInfoList = await _useCase.createUserPosts(newElements);
    state = AsyncValue.data(
      currentState.copyWith(
        userPosts: [...currentPosts, ...newQDocInfoList],
      ),
    );
  }
}