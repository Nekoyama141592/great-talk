// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePostState _$CreatePostStateFromJson(Map<String, dynamic> json) =>
    _CreatePostState(
      title: json['title'] as String? ?? '',
      systemPrompt:
          json['systemPrompt'] as String? ?? FormConsts.defaultSystemPrompt,
      description: json['description'] as String? ?? '',
      temperature: (json['temperature'] as num?)?.toDouble() ??
          FormConsts.defaultTemperature,
      topP: (json['topP'] as num?)?.toDouble() ?? FormConsts.defaultTopP,
      presencePenalty: (json['presencePenalty'] as num?)?.toDouble() ??
          FormConsts.defaultPresencePenalty,
      frequencyPenalty: (json['frequencyPenalty'] as num?)?.toDouble() ??
          FormConsts.defaultFrequencyPenalty,
      pickedImage: json['pickedImage'] as String?,
    );

Map<String, dynamic> _$CreatePostStateToJson(_CreatePostState instance) =>
    <String, dynamic>{
      'title': instance.title,
      'systemPrompt': instance.systemPrompt,
      'description': instance.description,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'presencePenalty': instance.presencePenalty,
      'frequencyPenalty': instance.frequencyPenalty,
      'pickedImage': instance.pickedImage,
    };
