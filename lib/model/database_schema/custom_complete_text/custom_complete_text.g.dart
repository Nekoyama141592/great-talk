// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_complete_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomCompleteText _$CustomCompleteTextFromJson(Map<String, dynamic> json) =>
    _CustomCompleteText(
      systemPrompt: json['systemPrompt'] as String,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['topP'] as num?)?.toDouble(),
      presencePenalty: (json['presencePenalty'] as num?)?.toDouble(),
      frequencyPenalty: (json['frequencyPenalty'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CustomCompleteTextToJson(_CustomCompleteText instance) =>
    <String, dynamic>{
      'systemPrompt': instance.systemPrompt,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'presencePenalty': instance.presencePenalty,
      'frequencyPenalty': instance.frequencyPenalty,
    };
