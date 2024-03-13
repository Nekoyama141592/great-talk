// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_text_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateTextResponseImpl _$$GenerateTextResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateTextResponseImpl(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GenerateTextResponseImplToJson(
        _$GenerateTextResponseImpl instance) =>
    <String, dynamic>{
      'choices': instance.choices,
    };
