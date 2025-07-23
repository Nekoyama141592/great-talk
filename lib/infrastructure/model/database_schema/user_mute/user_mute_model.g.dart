// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMute _$UserMuteFromJson(Map<String, dynamic> json) => _UserMute(
  activeUid: json['activeUid'] as String,
  createdAt: json['createdAt'],
  passiveUid: json['passiveUid'] as String,
);

Map<String, dynamic> _$UserMuteToJson(_UserMute instance) => <String, dynamic>{
  'activeUid': instance.activeUid,
  'createdAt': instance.createdAt,
  'passiveUid': instance.passiveUid,
};
