// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderated_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModeratedImage _$ModeratedImageFromJson(Map<String, dynamic> json) =>
    _ModeratedImage(
      moderationLabels:
          (json['moderationLabels'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      moderationModelVersion: json['moderationModelVersion'] as String? ?? "",
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ModeratedImageToJson(_ModeratedImage instance) =>
    <String, dynamic>{
      'moderationLabels': instance.moderationLabels,
      'moderationModelVersion': instance.moderationModelVersion,
      'key': instance.key,
    };
