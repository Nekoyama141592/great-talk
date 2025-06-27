import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database_schema/post/post.dart';
import 'package:great_talk/domain/entity/database_schema/public_user/public_user.dart';

part 'user_post.freezed.dart';
part 'user_post.g.dart';

@freezed
abstract class UserPost with _$UserPost {
  const factory UserPost({
    required Post post,
    required PublicUser? user,
    required String? base64,
  }) = _UserPost;
  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);
}
