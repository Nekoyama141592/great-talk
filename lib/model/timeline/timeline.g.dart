// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimelineImpl _$$TimelineImplFromJson(Map<String, dynamic> json) =>
    _$TimelineImpl(
      createdAt: json['createdAt'],
      isRead: json['isRead'] as bool,
      posterUid: json['posterUid'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$$TimelineImplToJson(_$TimelineImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
      'posterUid': instance.posterUid,
      'postId': instance.postId,
    };
