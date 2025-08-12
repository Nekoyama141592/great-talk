// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePostResponse _$CreatePostResponseFromJson(Map<String, dynamic> json) =>
    _CreatePostResponse(
      postId: json['postId'] as String,
      moderatedImage: json['moderatedImage'] as Map<String, dynamic>,
      detectedTitle: json['detectedTitle'] as Map<String, dynamic>,
      detectedDescription: json['detectedDescription'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CreatePostResponseToJson(_CreatePostResponse instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'moderatedImage': instance.moderatedImage,
      'detectedTitle': instance.detectedTitle,
      'detectedDescription': instance.detectedDescription,
    };
