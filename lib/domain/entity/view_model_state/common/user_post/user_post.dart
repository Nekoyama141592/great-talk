import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';

part 'user_post.freezed.dart';
part 'user_post.g.dart';

@freezed
abstract class UserPost with _$UserPost {
  const factory UserPost({
    required PostEntity post,
    required PublicUserEntity? user,
    required String? base64,
  }) = _UserPost;
  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);
}
