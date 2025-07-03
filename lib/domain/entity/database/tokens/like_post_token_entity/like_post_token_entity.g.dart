// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikePostTokenEntity _$LikePostTokenEntityFromJson(Map<String, dynamic> json) =>
    _LikePostTokenEntity(
      activeUid: json['activeUid'] as String,
      passiveUid: json['passiveUid'] as String,
      postId: json['postId'] as String,
      tokenId: json['tokenId'] as String,
    );

Map<String, dynamic> _$LikePostTokenEntityToJson(
  _LikePostTokenEntity instance,
) => <String, dynamic>{
  'activeUid': instance.activeUid,
  'passiveUid': instance.passiveUid,
  'postId': instance.postId,
  'tokenId': instance.tokenId,
};
