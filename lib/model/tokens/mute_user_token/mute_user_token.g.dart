// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MuteUserToken _$MuteUserTokenFromJson(Map<String, dynamic> json) =>
    _MuteUserToken(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      passiveUserRef: json['passiveUserRef'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$MuteUserTokenToJson(_MuteUserToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'passiveUid': instance.passiveUid,
      'passiveUserRef': instance.passiveUserRef,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
