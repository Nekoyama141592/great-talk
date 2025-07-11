// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_user_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MuteUserTokenModel _$MuteUserTokenModelFromJson(Map<String, dynamic> json) =>
    _MuteUserTokenModel(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$MuteUserTokenModelToJson(_MuteUserTokenModel instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'passiveUid': instance.passiveUid,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
