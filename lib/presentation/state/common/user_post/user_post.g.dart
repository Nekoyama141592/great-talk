// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPost _$UserPostFromJson(Map<String, dynamic> json) => _UserPost(
  post: Post.fromJson(json['post'] as Map<String, dynamic>),
  user:
      json['user'] == null
          ? null
          : PublicUserEntity.fromJson(json['user'] as Map<String, dynamic>),
  base64: json['base64'] as String?,
);

Map<String, dynamic> _$UserPostToJson(_UserPost instance) => <String, dynamic>{
  'post': instance.post,
  'user': instance.user,
  'base64': instance.base64,
};
