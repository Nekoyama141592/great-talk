import 'dart:async';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/view_model_state/posts/posts_state.dart';
import 'package:great_talk/providers/service/firestore/firestore_service_provider.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/providers/usecase/posts/posts_use_case.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/typedef/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'docs_view_model.g.dart';

@riverpod
class DocsViewModel extends _$DocsViewModel {
  @override
  FutureOr<PostsState> build(DocsType type) {
    return _fetchData();
  }

  
  PostsUseCase get _useCase => ref.read(postsUseCaseProvider);
  FirestoreRepository get _repository => _useCase.repository;

  // Query
  MapQuery _setQuery() {
    final service = ref.read(firestoreServiceProvider);
    switch (type) {
      case DocsType.newPosts:
        return service.postsByNewest();
      case DocsType.rankingPosts:
        return service.postsByMsgCount();
    }
  }

  Future<PostsState> _fetchData() async {
    final posts = await _repository.getPosts(_setQuery());
    final userPosts = await _useCase.createUserPosts(posts);
    return PostsState(userPosts: userPosts);
  }

  Future<void> onLoading(RefreshController refreshController) async {
    if (state.value?.userPosts.isEmpty ?? true) {
      refreshController.loadComplete();
      return;
    }
    final currentState = state.value!;
    final lastPost = currentState.userPosts.last.post;
    final posts =
          await _repository.getMorePosts(_setQuery(),lastPost);
    final sorted = _useCase.sortedPosts(posts);
    _addPosts(sorted);
    refreshController.loadComplete();
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
