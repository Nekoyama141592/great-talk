// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_complete_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomCompleteTextImpl _$$CustomCompleteTextImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomCompleteTextImpl(
      systemPrompt: json['systemPrompt'] as String,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['topP'] as num?)?.toDouble(),
      presencePenalty: (json['presencePenalty'] as num?)?.toDouble(),
      frequencyPenalty: (json['frequencyPenalty'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CustomCompleteTextImplToJson(
        _$CustomCompleteTextImpl instance) =>
    <String, dynamic>{
      'systemPrompt': instance.systemPrompt,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'presencePenalty': instance.presencePenalty,
      'frequencyPenalty': instance.frequencyPenalty,
    };
