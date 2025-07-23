// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowingTokenModel _$FollowingTokenModelFromJson(Map<String, dynamic> json) =>
    _FollowingTokenModel(
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$FollowingTokenModelToJson(
  _FollowingTokenModel instance,
) => <String, dynamic>{
  'createdAt': instance.createdAt,
  'passiveUid': instance.passiveUid,
  'tokenId': instance.tokenId,
  'tokenType': instance.tokenType,
};
