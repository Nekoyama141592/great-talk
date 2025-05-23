// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_limit_per_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatLimitPerDay _$ChatLimitPerDayFromJson(Map<String, dynamic> json) =>
    _ChatLimitPerDay(
      basic: (json['basic'] as num?)?.toInt() ??
          RemoteConfigConstants.basicLimitPerDay,
      free: (json['free'] as num?)?.toInt() ??
          RemoteConfigConstants.freeLimitPerDay,
      premium: (json['premium'] as num?)?.toInt() ??
          RemoteConfigConstants.premiumLimitPerDay,
    );

Map<String, dynamic> _$ChatLimitPerDayToJson(_ChatLimitPerDay instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'free': instance.free,
      'premium': instance.premium,
    };
