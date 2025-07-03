// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokensState _$TokensStateFromJson(Map<String, dynamic> json) => _TokensState(
  followingTokens:
      (json['followingTokens'] as List<dynamic>?)
          ?.map((e) => FollowingTokenEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FollowingTokenEntity>[],
  likePostTokens:
      (json['likePostTokens'] as List<dynamic>?)
          ?.map((e) => LikePostTokenEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LikePostTokenEntity>[],
  mutePostTokens:
      (json['mutePostTokens'] as List<dynamic>?)
          ?.map((e) => MutePostTokenEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MutePostTokenEntity>[],
  muteUserTokens:
      (json['muteUserTokens'] as List<dynamic>?)
          ?.map((e) => MuteUserTokenEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MuteUserTokenEntity>[],
  deletePostIds:
      (json['deletePostIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$TokensStateToJson(_TokensState instance) =>
    <String, dynamic>{
      'followingTokens': instance.followingTokens,
      'likePostTokens': instance.likePostTokens,
      'mutePostTokens': instance.mutePostTokens,
      'muteUserTokens': instance.muteUserTokens,
      'deletePostIds': instance.deletePostIds,
    };
