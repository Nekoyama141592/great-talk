// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateImageRequestImpl _$$GenerateImageRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateImageRequestImpl(
      model: json['model'] as String? ?? OpenAIConstants.imageModel,
      prompt: json['prompt'] as String,
      n: json['n'] as int? ?? 1,
      size: json['size'] as String? ?? "1024x1024",
      user: json['user'] as String,
    );

Map<String, dynamic> _$$GenerateImageRequestImplToJson(
        _$GenerateImageRequestImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'n': instance.n,
      'size': instance.size,
      'user': instance.user,
    };
