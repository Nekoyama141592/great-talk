// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_text_request_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateTextRequestMessage _$GenerateTextRequestMessageFromJson(
  Map<String, dynamic> json,
) => _GenerateTextRequestMessage(
  role: json['role'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$GenerateTextRequestMessageToJson(
  _GenerateTextRequestMessage instance,
) => <String, dynamic>{'role': instance.role, 'content': instance.content};
