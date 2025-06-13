// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_text_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateTextResponse _$GenerateTextResponseFromJson(
  Map<String, dynamic> json,
) => _GenerateTextResponse(
  model: json['model'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$GenerateTextResponseToJson(
  _GenerateTextResponse instance,
) => <String, dynamic>{'model': instance.model, 'content': instance.content};
