// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timeline _$$_TimelineFromJson(Map<String, dynamic> json) => _$_Timeline(
      createdAt: json['createdAt'],
      isRead: json['isRead'] as bool,
      posterUid: json['posterUid'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$$_TimelineToJson(_$_Timeline instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
      'posterUid': instance.posterUid,
      'postId': instance.postId,
    };
