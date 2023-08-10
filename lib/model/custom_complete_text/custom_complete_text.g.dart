// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_complete_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomCompleteText _$$_CustomCompleteTextFromJson(
        Map<String, dynamic> json) =>
    _$_CustomCompleteText(
      systemPrompt: json['systemPrompt'] as String,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['topP'] as num?)?.toDouble(),
      presencePenalty: (json['presencePenalty'] as num?)?.toDouble(),
      frequencyPenalty: (json['frequencyPenalty'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CustomCompleteTextToJson(
        _$_CustomCompleteText instance) =>
    <String, dynamic>{
      'systemPrompt': instance.systemPrompt,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'presencePenalty': instance.presencePenalty,
      'frequencyPenalty': instance.frequencyPenalty,
    };
