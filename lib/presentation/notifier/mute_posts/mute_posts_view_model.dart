import 'package:great_talk/core/constant/firestore_constant.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/state/tokens/tokens_state.dart';
import 'package:great_talk/presentation/state/posts/posts_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/posts/posts_use_case_provider.dart';
import 'package:great_talk/presentation/notifier/refresh_interface.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/application/use_case/posts/posts_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mute_posts_view_model.g.dart';

@riverpod
class MutePostsViewModel extends _$MutePostsViewModel
    implements RefreshInterface {
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
      final limit =
          remaining >= FirestoreConstant.whereInLimit
              ? FirestoreConstant.whereInLimit
              : remaining;
      return mutePostIds.sublist(currentDocsLength, currentDocsLength + limit);
    }
    return [];
  }

  FutureResult<bool> onMutePostCardTap(PostEntity post) async {
    final currentUid = ref.read(authUidProvider);
    if (currentUid == null) {
      return const Result.failure('ログインしてください');
    }
    final postId = post.postId;
    final deleteToken = _tokensState().mutePostTokens.firstWhere(
      (e) => e.postId == postId,
    );
    _tokensNotifier().removeMutePost(deleteToken);

    final newQDocInfoList =
        state.value!.userPosts.where((e) => e.post.postId != postId).toList();
    state = AsyncValue.data(state.value!.copyWith(userPosts: newQDocInfoList));

    return await _repository.deleteMutePostInfo(
      currentUid,
      post.uid,
      post.postId,
      deleteToken.tokenId,
    );
  }

  @override
  FutureResult<bool> onLoading() async {
    final currentState = state.value!;
    final lastPost = currentState.userPosts.last.post;
    final posts = await _repository.getMoreMutePosts(
      _createRequestPostIds(),
      lastPost.uid,
      lastPost.postId,
    );
    _addPosts(posts);
    return const Result.success(true);
  }

  Future<void> _addPosts(List<PostEntity> posts) async {
    if (state.isLoading || posts.isEmpty) return;
    final currentState = state.value!;
    final currentPosts = currentState.userPosts;
    final docIds = currentPosts.map((e) => e.post.postId).toSet();
    final newElements = posts.where((e) => !docIds.contains(e.postId)).toList();

    final newQDocInfoList = await _useCase.createUserPosts(newElements);
    state = AsyncValue.data(
      currentState.copyWith(userPosts: [...currentPosts, ...newQDocInfoList]),
    );
  }
}
