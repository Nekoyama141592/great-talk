// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostsState _$PostsStateFromJson(Map<String, dynamic> json) => _PostsState(
  userPosts:
      (json['userPosts'] as List<dynamic>?)
          ?.map((e) => UserPost.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  timelines:
      (json['timelines'] as List<dynamic>?)
          ?.map((e) => Timeline.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PostsStateToJson(_PostsState instance) =>
    <String, dynamic>{
      'userPosts': instance.userPosts,
      'timelines': instance.timelines,
    };
