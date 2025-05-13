// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_count_today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatCountTodayImpl _$$ChatCountTodayImplFromJson(Map<String, dynamic> json) =>
    _$ChatCountTodayImpl(
      basic: (json['basic'] as num?)?.toInt() ?? 0,
      premium: (json['premium'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ChatCountTodayImplToJson(
        _$ChatCountTodayImpl instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'premium': instance.premium,
    };
