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
      n: json['n'] as int?,
      stream: json['stream'] as bool?,
      stop: (json['stop'] as List<dynamic>?)?.map((e) => e as String).toList(),
      maxToken: json['maxToken'] as int?,
      presencePenalty: (json['presencePenalty'] as num?)?.toDouble(),
      frequencyPenalty: (json['frequencyPenalty'] as num?)?.toDouble(),
      functions: (json['functions'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      functionCall: json['functionCall'] as String?,
    );

Map<String, dynamic> _$$_CustomCompleteTextToJson(
        _$_CustomCompleteText instance) =>
    <String, dynamic>{
      'systemPrompt': instance.systemPrompt,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'n': instance.n,
      'stream': instance.stream,
      'stop': instance.stop,
      'maxToken': instance.maxToken,
      'presencePenalty': instance.presencePenalty,
      'frequencyPenalty': instance.frequencyPenalty,
      'functions': instance.functions,
      'functionCall': instance.functionCall,
    };
