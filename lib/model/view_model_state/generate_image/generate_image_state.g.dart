// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateImageStateImpl _$$GenerateImageStateImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateImageStateImpl(
      prompt: json['prompt'] as String? ?? '',
      size: json['size'] as String? ?? '',
      base64: json['base64'] as String?,
    );

Map<String, dynamic> _$$GenerateImageStateImplToJson(
        _$GenerateImageStateImpl instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'size': instance.size,
      'base64': instance.base64,
    };
