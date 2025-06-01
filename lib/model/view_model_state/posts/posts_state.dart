import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/timeline/timeline.dart';
import 'package:great_talk/model/view_model_state/common/user_post/user_post.dart';

part 'posts_state.freezed.dart';
part 'posts_state.g.dart';

@freezed
abstract class PostsState with _$PostsState {
  const PostsState._();
  const factory PostsState({
    @Default([]) List<UserPost> userPosts,
    @Default([]) List<Timeline> timelines
  }) = _PostsState;
  factory PostsState.fromJson(Map<String, dynamic> json) =>
      _$PostsStateFromJson(json);
  List<Post> posts() => userPosts.map((e) => e.post).toList();
}
