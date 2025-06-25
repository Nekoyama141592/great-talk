// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timelines_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelinesState _$TimelinesStateFromJson(Map<String, dynamic> json) =>
    _TimelinesState(
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

Map<String, dynamic> _$TimelinesStateToJson(_TimelinesState instance) =>
    <String, dynamic>{
      'userPosts': instance.userPosts,
      'timelines': instance.timelines,
    };
