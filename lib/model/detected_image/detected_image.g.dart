// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetectedImage _$$_DetectedImageFromJson(Map<String, dynamic> json) =>
    _$_DetectedImage(
      moderationLabels: (json['moderationLabels'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      moderationModelVersion: json['moderationModelVersion'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_DetectedImageToJson(_$_DetectedImage instance) =>
    <String, dynamic>{
      'moderationLabels': instance.moderationLabels,
      'moderationModelVersion': instance.moderationModelVersion,
      'value': instance.value,
    };
