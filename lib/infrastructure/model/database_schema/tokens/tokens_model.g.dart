// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tokens _$TokensFromJson(Map<String, dynamic> json) => _Tokens(
  followingTokens:
      (json['followingTokens'] as List<dynamic>?)
          ?.map((e) => FollowingToken.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FollowingToken>[],
  likePostTokens:
      (json['likePostTokens'] as List<dynamic>?)
          ?.map((e) => LikePostToken.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LikePostToken>[],
  mutePostTokens:
      (json['mutePostTokens'] as List<dynamic>?)
          ?.map((e) => MutePostToken.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MutePostToken>[],
  muteUserTokens:
      (json['muteUserTokens'] as List<dynamic>?)
          ?.map((e) => MuteUserToken.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MuteUserToken>[],
);

Map<String, dynamic> _$TokensToJson(_Tokens instance) => <String, dynamic>{
  'followingTokens': instance.followingTokens,
  'likePostTokens': instance.likePostTokens,
  'mutePostTokens': instance.mutePostTokens,
  'muteUserTokens': instance.muteUserTokens,
};
