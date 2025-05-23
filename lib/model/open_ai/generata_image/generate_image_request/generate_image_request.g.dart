// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateImageRequest _$GenerateImageRequestFromJson(
        Map<String, dynamic> json) =>
    _GenerateImageRequest(
      model: json['model'] as String? ?? OpenAIConstants.imageModel,
      prompt: json['prompt'] as String,
      n: (json['n'] as num?)?.toInt() ?? 1,
      size: json['size'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$GenerateImageRequestToJson(
        _GenerateImageRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'n': instance.n,
      'size': instance.size,
      'user': instance.user,
    };
