// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_post_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MutePostTokenModel _$MutePostTokenModelFromJson(Map<String, dynamic> json) =>
    _MutePostTokenModel(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      postId: json['postId'] as String,
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$MutePostTokenModelToJson(_MutePostTokenModel instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'postId': instance.postId,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
