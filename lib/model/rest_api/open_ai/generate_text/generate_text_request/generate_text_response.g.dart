// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_text_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateTextResponse _$GenerateTextResponseFromJson(
        Map<String, dynamic> json) =>
    _GenerateTextResponse(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$GenerateTextResponseToJson(
        _GenerateTextResponse instance) =>
    <String, dynamic>{
      'choices': instance.choices,
    };
