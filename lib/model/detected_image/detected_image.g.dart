// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetectedImage _$$_DetectedImageFromJson(Map<String, dynamic> json) =>
    _$_DetectedImage(
      bucketName: json['bucketName'] as String,
      moderationLabels: (json['moderationLabels'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      moderationModelVersion: json['moderationModelVersion'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_DetectedImageToJson(_$_DetectedImage instance) =>
    <String, dynamic>{
      'bucketName': instance.bucketName,
      'moderationLabels': instance.moderationLabels,
      'moderationModelVersion': instance.moderationModelVersion,
      'value': instance.value,
    };
