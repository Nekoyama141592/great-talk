// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModerationLabelImpl _$$ModerationLabelImplFromJson(
        Map<String, dynamic> json) =>
    _$ModerationLabelImpl(
      Confidence: json['Confidence'] as num,
      Name: json['Name'] as String,
      ParentName: json['ParentName'] as String,
    );

Map<String, dynamic> _$$ModerationLabelImplToJson(
        _$ModerationLabelImpl instance) =>
    <String, dynamic>{
      'Confidence': instance.Confidence,
      'Name': instance.Name,
      'ParentName': instance.ParentName,
    };
