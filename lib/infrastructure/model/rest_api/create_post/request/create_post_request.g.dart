// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePostRequest _$CreatePostRequestFromJson(Map<String, dynamic> json) =>
    _CreatePostRequest(
      title: json['title'] as String,
      description: json['description'] as String,
      base64Image: json['base64Image'] as String,
      systemPrompt: json['systemPrompt'] as String,
    );

Map<String, dynamic> _$CreatePostRequestToJson(_CreatePostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'base64Image': instance.base64Image,
      'systemPrompt': instance.systemPrompt,
    };
