// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUpdateLogImpl _$$UserUpdateLogImplFromJson(Map<String, dynamic> json) =>
    _$UserUpdateLogImpl(
      logCreatedAt: json['logCreatedAt'],
      searchToken: json['searchToken'] as Map<String, dynamic>,
      stringBio: json['stringBio'] as String,
      stringUserName: json['stringUserName'] as String,
      uid: json['uid'] as String,
      imageFileName: json['imageFileName'] as String,
      userRef: json['userRef'],
    );

Map<String, dynamic> _$$UserUpdateLogImplToJson(_$UserUpdateLogImpl instance) =>
    <String, dynamic>{
      'logCreatedAt': instance.logCreatedAt,
      'searchToken': instance.searchToken,
      'stringBio': instance.stringBio,
      'stringUserName': instance.stringUserName,
      'uid': instance.uid,
      'imageFileName': instance.imageFileName,
      'userRef': instance.userRef,
    };
