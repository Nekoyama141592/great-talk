// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUpdateLogImpl _$$UserUpdateLogImplFromJson(Map<String, dynamic> json) =>
    _$UserUpdateLogImpl(
      logCreatedAt: json['logCreatedAt'],
      searchTarget: json['searchTarget'] as String,
      searchTerm: json['searchTerm'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$UserUpdateLogImplToJson(_$UserUpdateLogImpl instance) =>
    <String, dynamic>{
      'logCreatedAt': instance.logCreatedAt,
      'searchTarget': instance.searchTarget,
      'searchTerm': instance.searchTerm,
      'uid': instance.uid,
    };
