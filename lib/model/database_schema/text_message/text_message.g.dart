// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextMessage _$TextMessageFromJson(Map<String, dynamic> json) => _TextMessage(
  createdAt: json['createdAt'],
  id: json['id'] as String,
  messageType: json['messageType'] as String,
  posterUid: json['posterUid'] as String,
  senderUid: json['senderUid'] as String,
  text: json['text'] as Map<String, dynamic>,
);

Map<String, dynamic> _$TextMessageToJson(_TextMessage instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'messageType': instance.messageType,
      'posterUid': instance.posterUid,
      'senderUid': instance.senderUid,
      'text': instance.text,
    };
