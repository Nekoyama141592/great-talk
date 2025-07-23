// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tokens _$TokensFromJson(Map<String, dynamic> json) => _Tokens(
  followingTokens:
      (json['followingTokens'] as List<dynamic>?)
          ?.map((e) => FollowingTokenModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FollowingTokenModel>[],
  likePostTokens:
      (json['likePostTokens'] as List<dynamic>?)
          ?.map((e) => LikePostTokenModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LikePostTokenModel>[],
  mutePostTokens:
      (json['mutePostTokens'] as List<dynamic>?)
          ?.map((e) => MutePostTokenModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MutePostTokenModel>[],
  muteUserTokens:
      (json['muteUserTokens'] as List<dynamic>?)
          ?.map((e) => MuteUserTokenModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MuteUserTokenModel>[],
);

Map<String, dynamic> _$TokensToJson(_Tokens instance) => <String, dynamic>{
  'followingTokens': instance.followingTokens,
  'likePostTokens': instance.likePostTokens,
  'mutePostTokens': instance.mutePostTokens,
  'muteUserTokens': instance.muteUserTokens,
};
