// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_text_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateTextRequest _$GenerateTextRequestFromJson(Map<String, dynamic> json) =>
    _GenerateTextRequest(
      model: json['model'] as String,
      messages:
          (json['messages'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      tools:
          (json['tools'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList(),
      tool_choice: json['tool_choice'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GenerateTextRequestToJson(
  _GenerateTextRequest instance,
) => <String, dynamic>{
  'model': instance.model,
  'messages': instance.messages,
  'tools': instance.tools,
  'tool_choice': instance.tool_choice,
};
