// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserUpdateLog _$UserUpdateLogFromJson(Map<String, dynamic> json) =>
    _UserUpdateLog(
      logCreatedAt: json['logCreatedAt'],
      searchToken: json['searchToken'] as Map<String, dynamic>,
      stringBio: json['stringBio'] as String,
      stringUserName: json['stringUserName'] as String,
      uid: json['uid'] as String,
      image: json['image'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UserUpdateLogToJson(_UserUpdateLog instance) =>
    <String, dynamic>{
      'logCreatedAt': instance.logCreatedAt,
      'searchToken': instance.searchToken,
      'stringBio': instance.stringBio,
      'stringUserName': instance.stringUserName,
      'uid': instance.uid,
      'image': instance.image,
    };
