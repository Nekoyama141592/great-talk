import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/database_schema/post/post.dart';
import 'package:great_talk/domain/database_schema/public_user/public_user.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState({
    required PublicUser? user,
    required String? base64,
    required List<UserPost> userPosts,
  }) = _ProfileState;
  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);
  List<Post> posts() => userPosts.map((e) => e.post).toList();
}
