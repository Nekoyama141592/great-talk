// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMute _$UserMuteFromJson(Map<String, dynamic> json) => _UserMute(
  activeUid: json['activeUid'] as String,
  activeUserRef: json['activeUserRef'],
  createdAt: json['createdAt'],
  passiveUid: json['passiveUid'] as String,
  passiveUserRef: json['passiveUserRef'],
);

Map<String, dynamic> _$UserMuteToJson(_UserMute instance) => <String, dynamic>{
  'activeUid': instance.activeUid,
  'activeUserRef': instance.activeUserRef,
  'createdAt': instance.createdAt,
  'passiveUid': instance.passiveUid,
  'passiveUserRef': instance.passiveUserRef,
};
