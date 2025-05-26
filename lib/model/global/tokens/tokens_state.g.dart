// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokensState _$TokensStateFromJson(Map<String, dynamic> json) => _TokensState(
  bookmarkCategoryTokens:
      (json['bookmarkCategoryTokens'] as List<dynamic>?)
          ?.map((e) => BookmarkCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <BookmarkCategory>[],
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
  reportPostTokens:
      (json['reportPostTokens'] as List<dynamic>?)
          ?.map((e) => ReportPostToken.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ReportPostToken>[],
  deletePostIds:
      (json['deletePostIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$TokensStateToJson(_TokensState instance) =>
    <String, dynamic>{
      'bookmarkCategoryTokens': instance.bookmarkCategoryTokens,
      'followingTokens': instance.followingTokens,
      'likePostTokens': instance.likePostTokens,
      'mutePostTokens': instance.mutePostTokens,
      'muteUserTokens': instance.muteUserTokens,
      'reportPostTokens': instance.reportPostTokens,
      'deletePostIds': instance.deletePostIds,
    };
