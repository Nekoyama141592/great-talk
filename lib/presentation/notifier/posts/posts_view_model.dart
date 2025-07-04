import 'dart:async';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/state/posts/posts_state.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/posts/posts_use_case_provider.dart';
import 'package:great_talk/presentation/notifier/refresh_interface.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/application/use_case/posts/posts_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_view_model.g.dart';

@Riverpod(keepAlive: true)
class PostsViewModel extends _$PostsViewModel implements RefreshInterface {
  @override
  FutureOr<PostsState> build(bool isRankingPosts) {
    return _fetchData();
  }

  PostsUseCase get _useCase => ref.read(postsUseCaseProvider);
  DatabaseRepository get _repository => _useCase.repository;

  Future<PostsState> _fetchData() async {
    final user = ref.watch(authProvider);
    if (user == null) return PostsState();
    final posts = await _repository.getPosts(isRankingPosts);
    final userPosts = await _useCase.createUserPosts(
      posts,
      isRankingPosts: isRankingPosts,
    );
    return PostsState(userPosts: userPosts);
  }

  @override
  FutureResult<bool> onLoading() async {
    final currentState = state.value!;
    final lastPost = currentState.userPosts.last.post;
    final posts = await _repository.getMorePosts(
      isRankingPosts,
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

    final newQDocInfoList = await _useCase.createUserPosts(
      newElements,
      isRankingPosts: isRankingPosts,
    );
    state = AsyncValue.data(
      currentState.copyWith(userPosts: [...currentPosts, ...newQDocInfoList]),
    );
  }
}
