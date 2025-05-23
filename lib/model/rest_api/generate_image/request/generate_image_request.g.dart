// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateImageRequest _$GenerateImageRequestFromJson(
        Map<String, dynamic> json) =>
    _GenerateImageRequest(
      prompt: json['prompt'] as String,
      size: json['size'] as String,
    );

Map<String, dynamic> _$GenerateImageRequestToJson(
        _GenerateImageRequest instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'size': instance.size,
    };
