// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateImageState _$GenerateImageStateFromJson(Map<String, dynamic> json) =>
    _GenerateImageState(
      prompt: json['prompt'] as String? ?? '',
      size: json['size'] as String? ?? '',
      base64: json['base64'] as String?,
    );

Map<String, dynamic> _$GenerateImageStateToJson(_GenerateImageState instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'size': instance.size,
      'base64': instance.base64,
    };
