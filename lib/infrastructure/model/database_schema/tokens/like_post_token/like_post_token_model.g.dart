// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikePostToken _$LikePostTokenFromJson(Map<String, dynamic> json) =>
    _LikePostToken(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      postId: json['postId'] as String,
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$LikePostTokenToJson(_LikePostToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'passiveUid': instance.passiveUid,
      'postId': instance.postId,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
