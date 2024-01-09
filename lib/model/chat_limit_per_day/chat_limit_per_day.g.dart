// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_limit_per_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatLimitPerDayImpl _$$ChatLimitPerDayImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatLimitPerDayImpl(
      basic: json['basic'] as int? ?? RemoteConfigConstants.basicLimitPerDay,
      free: json['free'] as int? ?? RemoteConfigConstants.freeLimitPerDay,
      premium:
          json['premium'] as int? ?? RemoteConfigConstants.premiumLimitPerDay,
    );

Map<String, dynamic> _$$ChatLimitPerDayImplToJson(
        _$ChatLimitPerDayImpl instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'free': instance.free,
      'premium': instance.premium,
    };
