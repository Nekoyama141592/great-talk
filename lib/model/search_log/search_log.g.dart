// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserUpdateLog _$UserUpdateLogFromJson(Map<String, dynamic> json) =>
    _UserUpdateLog(
      logCreatedAt: json['logCreatedAt'],
      searchTarget: json['searchTarget'] as String,
      searchTerm: json['searchTerm'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$UserUpdateLogToJson(_UserUpdateLog instance) =>
    <String, dynamic>{
      'logCreatedAt': instance.logCreatedAt,
      'searchTarget': instance.searchTarget,
      'searchTerm': instance.searchTerm,
      'uid': instance.uid,
    };
