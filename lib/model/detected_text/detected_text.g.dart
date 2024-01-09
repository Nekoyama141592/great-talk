// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectedTextImpl _$$DetectedTextImplFromJson(Map<String, dynamic> json) =>
    _$DetectedTextImpl(
      languageCode: json['languageCode'] as String? ?? "",
      negativeScore: json['negativeScore'] as int? ?? 0,
      positiveScore: json['positiveScore'] as int? ?? 0,
      sentiment: json['sentiment'] as String? ?? "",
      value: json['value'] as String? ?? "",
    );

Map<String, dynamic> _$$DetectedTextImplToJson(_$DetectedTextImpl instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'negativeScore': instance.negativeScore,
      'positiveScore': instance.positiveScore,
      'sentiment': instance.sentiment,
      'value': instance.value,
    };
