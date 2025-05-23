// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowingToken _$FollowingTokenFromJson(Map<String, dynamic> json) =>
    _FollowingToken(
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      passiveUserRef: json['passiveUserRef'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$FollowingTokenToJson(_FollowingToken instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'passiveUid': instance.passiveUid,
      'passiveUserRef': instance.passiveUserRef,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
