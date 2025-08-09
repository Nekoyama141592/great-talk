import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState({
    required PublicUserEntity? user,
    required List<UserPost> userPosts,
  }) = _ProfileState;
  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);
  List<PostEntity> posts() => userPosts.map((e) => e.post).toList();
}
