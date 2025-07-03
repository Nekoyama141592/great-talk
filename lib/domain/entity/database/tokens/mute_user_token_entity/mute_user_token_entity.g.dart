// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_user_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MuteUserTokenEntity _$MuteUserTokenEntityFromJson(Map<String, dynamic> json) =>
    _MuteUserTokenEntity(
      activeUid: json['activeUid'] as String,
      passiveUid: json['passiveUid'] as String,
      tokenId: json['tokenId'] as String,
    );

Map<String, dynamic> _$MuteUserTokenEntityToJson(
  _MuteUserTokenEntity instance,
) => <String, dynamic>{
  'activeUid': instance.activeUid,
  'passiveUid': instance.passiveUid,
  'tokenId': instance.tokenId,
};
