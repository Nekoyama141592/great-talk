// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_text_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaveTextMsg _$$_SaveTextMsgFromJson(Map<String, dynamic> json) =>
    _$_SaveTextMsg(
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String,
      messageType: json['messageType'] as String,
      posterUid: json['posterUid'] as String,
      senderUid: json['senderUid'] as String,
      text: json['text'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_SaveTextMsgToJson(_$_SaveTextMsg instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'messageType': instance.messageType,
      'posterUid': instance.posterUid,
      'senderUid': instance.senderUid,
      'text': instance.text,
    };
