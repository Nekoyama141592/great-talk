import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/state/timelines/timelines_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/posts/posts_use_case_provider.dart';
import 'package:great_talk/presentation/notifier/refresh_interface.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/application/use_case/posts/posts_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'timelines_view_model.g.dart';

@Riverpod(keepAlive: true)
class TimelinesViewModel extends _$TimelinesViewModel
    implements RefreshInterface {
  @override
  FutureOr<TimelinesState> build() => _fetchData();
  PostsUseCase get _useCase => ref.read(postsUseCaseProvider);
  DatabaseRepository get _repository => _useCase.repository;

  Future<TimelinesState> _fetchData() async {
    final user = ref.read(authProvider);
    if (user == null || user.isAnonymous) return TimelinesState();
    final currentUid = user.uid;
    final timelines = await _repository.getTimelines(currentUid);
    final postIds = timelines.map((e) => e.postId).toList();
    final posts = await _timelinesToPostsResult(postIds);
    final userPosts = await _useCase.createUserPosts(posts);
    return TimelinesState(timelines: timelines, userPosts: userPosts);
  }

  Future<List<PostEntity>> _timelinesToPostsResult(List<String> postIds) {
    return _repository.getTimelinePosts(postIds);
  }

  @override
  FutureResult<bool> onLoading() async {
    final user = ref.read(authProvider);
    if (user == null || user.isAnonymous) {
      return const Result.failure('ログインしてください');
    }
    final currentUid = user.uid;
    final currentState = state.value!;
    final lastTimeline = currentState.timelines.last;
    final timelines = await _repository.getMoreTimelines(
      currentUid,
      lastTimeline.postId,
    );
    final postIds = timelines.map((e) => e.postId).toList();
    final postResult = await _timelinesToPostsResult(postIds);
    final newUserPosts = await _useCase.createUserPosts(postResult);
    final userPost = [...currentState.userPosts, ...newUserPosts];
    final newTimelines = [...currentState.timelines, ...timelines];
    state = AsyncValue.data(
      currentState.copyWith(timelines: newTimelines, userPosts: userPost),
    );
    return const Result.success(true);
  }
}
