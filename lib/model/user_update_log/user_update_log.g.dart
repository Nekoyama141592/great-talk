// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserUpdateLog _$$_UserUpdateLogFromJson(Map<String, dynamic> json) =>
    _$_UserUpdateLog(
      logCreatedAt: json['logCreatedAt'],
      searchToken: json['searchToken'] as Map<String, dynamic>,
      stringBio: json['stringBio'] as String,
      stringUserName: json['stringUserName'] as String,
      uid: json['uid'] as String,
      userImageUrl: json['userImageUrl'] as String,
      userRef: json['userRef'],
    );

Map<String, dynamic> _$$_UserUpdateLogToJson(_$_UserUpdateLog instance) =>
    <String, dynamic>{
      'logCreatedAt': instance.logCreatedAt,
      'searchToken': instance.searchToken,
      'stringBio': instance.stringBio,
      'stringUserName': instance.stringUserName,
      'uid': instance.uid,
      'userImageUrl': instance.userImageUrl,
      'userRef': instance.userRef,
    };
