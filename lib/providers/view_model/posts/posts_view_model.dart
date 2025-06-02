import 'dart:async';
import 'package:great_talk/model/view_model_state/posts/posts_state.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/providers/usecase/posts/posts_use_case.dart';
import 'package:great_talk/providers/view_model/refresh_interface.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_view_model.g.dart';

@riverpod
class PostsViewModel extends _$PostsViewModel implements RefreshInterface {
  @override
  FutureOr<PostsState> build(bool isRankingPosts) {
    return _fetchData();
  }

  PostsUseCase get _useCase => ref.read(postsUseCaseProvider);
  FirestoreRepository get _repository => _useCase.repository;

  Future<PostsState> _fetchData() async {
    final posts = await _repository.getPosts(isRankingPosts);
    final userPosts = await _useCase.createUserPosts(posts);
    return PostsState(userPosts: userPosts);
  }
  @override
  FutureResult<bool> onLoading() async {
    final currentState = state.value!;
    final lastPost = currentState.userPosts.last.post;
    final posts =
          await _repository.getMorePosts(isRankingPosts,lastPost);
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
