// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Follower _$FollowerFromJson(Map<String, dynamic> json) => _Follower(
  activeUid: json['activeUid'] as String,
  createdAt: json['createdAt'],
  passiveUid: json['passiveUid'] as String,
);

Map<String, dynamic> _$FollowerToJson(_Follower instance) => <String, dynamic>{
  'activeUid': instance.activeUid,
  'createdAt': instance.createdAt,
  'passiveUid': instance.passiveUid,
};
