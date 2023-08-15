// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatContent _$$_ChatContentFromJson(Map<String, dynamic> json) =>
    _$_ChatContent(
      contentId: json['contentId'] as String,
      customCompleteText: json['customCompleteText'] as Map<String, dynamic>?,
      description: json['description'] as Map<String, dynamic>?,
      image: json['image'] as Map<String, dynamic>?,
      imageValue: json['imageValue'] as String,
      lastSeen: json['lastSeen'] as int?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      msgCount: json['msgCount'] as int,
      posterUid: json['posterUid'] as String,
      ref: json['ref'],
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_ChatContentToJson(_$_ChatContent instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'customCompleteText': instance.customCompleteText,
      'description': instance.description,
      'image': instance.image,
      'imageValue': instance.imageValue,
      'lastSeen': instance.lastSeen,
      'metadata': instance.metadata,
      'msgCount': instance.msgCount,
      'posterUid': instance.posterUid,
      'ref': instance.ref,
      'title': instance.title,
    };
