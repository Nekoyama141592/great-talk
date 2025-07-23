// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetectedText _$DetectedTextFromJson(Map<String, dynamic> json) =>
    _DetectedText(
      languageCode: json['languageCode'] as String? ?? "",
      negativeScore: (json['negativeScore'] as num?)?.toInt() ?? 0,
      positiveScore: (json['positiveScore'] as num?)?.toInt() ?? 0,
      sentiment: json['sentiment'] as String? ?? "",
      value: json['value'] as String? ?? "",
    );

Map<String, dynamic> _$DetectedTextToJson(_DetectedText instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'negativeScore': instance.negativeScore,
      'positiveScore': instance.positiveScore,
      'sentiment': instance.sentiment,
      'value': instance.value,
    };
