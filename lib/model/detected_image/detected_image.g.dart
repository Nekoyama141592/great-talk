// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetectedImage _$DetectedImageFromJson(Map<String, dynamic> json) =>
    _DetectedImage(
      bucketName: json['bucketName'] as String? ?? "",
      moderationLabels: (json['moderationLabels'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      moderationModelVersion: json['moderationModelVersion'] as String? ?? "",
      value: json['value'] as String? ?? "",
    );

Map<String, dynamic> _$DetectedImageToJson(_DetectedImage instance) =>
    <String, dynamic>{
      'bucketName': instance.bucketName,
      'moderationLabels': instance.moderationLabels,
      'moderationModelVersion': instance.moderationModelVersion,
      'value': instance.value,
    };
