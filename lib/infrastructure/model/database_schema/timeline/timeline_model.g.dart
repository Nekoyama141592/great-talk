// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineModel _$TimelineModelFromJson(Map<String, dynamic> json) =>
    _TimelineModel(
      createdAt: json['createdAt'],
      isRead: json['isRead'] as bool,
      posterUid: json['posterUid'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$TimelineModelToJson(_TimelineModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
      'posterUid': instance.posterUid,
      'postId': instance.postId,
    };
