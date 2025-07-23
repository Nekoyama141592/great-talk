// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextMessage _$TextMessageFromJson(Map<String, dynamic> json) => _TextMessage(
  createdAt: DateTime.parse(json['createdAt'] as String),
  id: json['id'] as String,
  messageType: json['messageType'] as String,
  senderUid: json['senderUid'] as String,
  text: const DetectedTextConverter().fromJson(
    json['text'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TextMessageToJson(_TextMessage instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'messageType': instance.messageType,
      'senderUid': instance.senderUid,
      'text': const DetectedTextConverter().toJson(instance.text),
    };
