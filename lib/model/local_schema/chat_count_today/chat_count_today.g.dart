// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_count_today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatCountToday _$ChatCountTodayFromJson(Map<String, dynamic> json) =>
    _ChatCountToday(
      basic: (json['basic'] as num?)?.toInt() ?? 0,
      premium: (json['premium'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChatCountTodayToJson(_ChatCountToday instance) =>
    <String, dynamic>{'basic': instance.basic, 'premium': instance.premium};
