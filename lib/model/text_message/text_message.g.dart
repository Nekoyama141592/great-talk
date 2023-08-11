// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TextMessage _$$_TextMessageFromJson(Map<String, dynamic> json) =>
    _$_TextMessage(
      createdAt: json['createdAt'],
      id: json['id'] as String,
      messageType: json['messageType'] as String,
      messageRef: json['messageRef'],
      postRef: json['postRef'],
      posterUid: json['posterUid'] as String,
      senderUid: json['senderUid'] as String,
      updatedAt: json['updatedAt'],
      text: json['text'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_TextMessageToJson(_$_TextMessage instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'messageType': instance.messageType,
      'messageRef': instance.messageRef,
      'postRef': instance.postRef,
      'posterUid': instance.posterUid,
      'senderUid': instance.senderUid,
      'updatedAt': instance.updatedAt,
      'text': instance.text,
    };
