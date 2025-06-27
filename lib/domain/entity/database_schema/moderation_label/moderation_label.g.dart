// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModerationLabel _$ModerationLabelFromJson(Map<String, dynamic> json) =>
    _ModerationLabel(
      Confidence: json['Confidence'] as num,
      Name: json['Name'] as String,
      ParentName: json['ParentName'] as String,
    );

Map<String, dynamic> _$ModerationLabelToJson(_ModerationLabel instance) =>
    <String, dynamic>{
      'Confidence': instance.Confidence,
      'Name': instance.Name,
      'ParentName': instance.ParentName,
    };
