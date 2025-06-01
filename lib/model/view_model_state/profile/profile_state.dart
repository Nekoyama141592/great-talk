import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/database_schema/user_post/user_post.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    required PublicUser? user,
    required String? base64,
    required List<UserPost> userPosts,
  }) = _ProfileState;
  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);
}
