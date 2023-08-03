// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatContent _$$_ChatContentFromJson(Map<String, dynamic> json) =>
    _$_ChatContent(
      contentId: json['contentId'] as String,
      customCompleteText: json['customCompleteText'] as Map<String, dynamic>?,
      imageUrl: json['imageUrl'] as String,
      lastSeen: json['lastSeen'] as int?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      posterUid: json['posterUid'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_ChatContentToJson(_$_ChatContent instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'customCompleteText': instance.customCompleteText,
      'imageUrl': instance.imageUrl,
      'lastSeen': instance.lastSeen,
      'metadata': instance.metadata,
      'posterUid': instance.posterUid,
      'title': instance.title,
    };
