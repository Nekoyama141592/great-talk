import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';

part 'posts_state.freezed.dart';
part 'posts_state.g.dart';

@freezed
abstract class PostsState with _$PostsState {
  const PostsState._();
  const factory PostsState({@Default([]) List<UserPost> userPosts}) =
      _PostsState;
  factory PostsState.fromJson(Map<String, dynamic> json) =>
      _$PostsStateFromJson(json);
  List<PostEntity> posts() => userPosts.map((e) => e.post).toList();
}
