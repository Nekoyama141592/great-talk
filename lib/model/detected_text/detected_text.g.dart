// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetectedText _$$_DetectedTextFromJson(Map<String, dynamic> json) =>
    _$_DetectedText(
      languageCode: json['languageCode'] as String,
      negativeScore: (json['negativeScore'] as num).toDouble(),
      positiveScore: (json['positiveScore'] as num).toDouble(),
      sentiment: json['sentiment'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_DetectedTextToJson(_$_DetectedText instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'negativeScore': instance.negativeScore,
      'positiveScore': instance.positiveScore,
      'sentiment': instance.sentiment,
      'value': instance.value,
    };
