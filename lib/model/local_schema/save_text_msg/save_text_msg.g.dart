// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_text_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveTextMsg _$SaveTextMsgFromJson(Map<String, dynamic> json) => _SaveTextMsg(
  createdAt: DateTime.parse(json['createdAt'] as String),
  id: json['id'] as String,
  messageType: json['messageType'] as String,
  posterUid: json['posterUid'] as String,
  senderUid: json['senderUid'] as String,
  text: json['text'] as Map<String, dynamic>,
);

Map<String, dynamic> _$SaveTextMsgToJson(_SaveTextMsg instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'messageType': instance.messageType,
      'posterUid': instance.posterUid,
      'senderUid': instance.senderUid,
      'text': instance.text,
    };
