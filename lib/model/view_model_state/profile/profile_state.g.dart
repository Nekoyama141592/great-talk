// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileState _$ProfileStateFromJson(Map<String, dynamic> json) =>
    _ProfileState(
      user:
          json['user'] == null
              ? null
              : PublicUser.fromJson(json['user'] as Map<String, dynamic>),
      base64: json['base64'] as String?,
      posts:
          (json['posts'] as List<dynamic>)
              .map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProfileStateToJson(_ProfileState instance) =>
    <String, dynamic>{
      'user': instance.user,
      'base64': instance.base64,
      'posts': instance.posts,
    };
