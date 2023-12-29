// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextMessageImpl _$$TextMessageImplFromJson(Map<String, dynamic> json) =>
    _$TextMessageImpl(
      createdAt: json['createdAt'],
      id: json['id'] as String,
      messageType: json['messageType'] as String,
      messageRef: json['messageRef'],
      postRef: json['postRef'],
      posterUid: json['posterUid'] as String,
      senderUid: json['senderUid'] as String,
      text: json['text'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$TextMessageImplToJson(_$TextMessageImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'messageType': instance.messageType,
      'messageRef': instance.messageRef,
      'postRef': instance.postRef,
      'posterUid': instance.posterUid,
      'senderUid': instance.senderUid,
      'text': instance.text,
    };
