// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_post_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MutePostTokenEntity _$MutePostTokenEntityFromJson(Map<String, dynamic> json) =>
    _MutePostTokenEntity(
      activeUid: json['activeUid'] as String,
      postId: json['postId'] as String,
      tokenId: json['tokenId'] as String,
    );

Map<String, dynamic> _$MutePostTokenEntityToJson(
  _MutePostTokenEntity instance,
) => <String, dynamic>{
  'activeUid': instance.activeUid,
  'postId': instance.postId,
  'tokenId': instance.tokenId,
};
