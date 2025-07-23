import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database/tokens/following_token_entity/following_token_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/like_post_token_entity/like_post_token_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_post_token_entity/mute_post_token_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_user_token_entity/mute_user_token_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/tokens_model.dart';

part 'tokens_state.freezed.dart';
part 'tokens_state.g.dart';

@freezed
abstract class TokensState with _$TokensState {
  const TokensState._();
  const factory TokensState({
    @Default(<FollowingTokenEntity>[])
    List<FollowingTokenEntity> followingTokens,
    @Default(<LikePostTokenEntity>[]) List<LikePostTokenEntity> likePostTokens,
    @Default(<MutePostTokenEntity>[]) List<MutePostTokenEntity> mutePostTokens,
    @Default(<MuteUserTokenEntity>[]) List<MuteUserTokenEntity> muteUserTokens,
    @Default(<String>[]) List<String> deletePostIds,
  }) = _TokensState;
  factory TokensState.fromJson(Map<String, dynamic> json) =>
      _$TokensStateFromJson(json);

  factory TokensState.fromModel(Tokens tokens) {
    return TokensState(
      followingTokens:
          tokens.followingTokens
              .map((token) => FollowingTokenEntity.fromModel(token))
              .toList(),
      likePostTokens:
          tokens.likePostTokens
              .map((token) => LikePostTokenEntity.fromModel(token))
              .toList(),
      mutePostTokens:
          tokens.mutePostTokens
              .map((token) => MutePostTokenEntity.fromModel(token))
              .toList(),
      muteUserTokens:
          tokens.muteUserTokens
              .map((token) => MuteUserTokenEntity.fromModel(token))
              .toList(),
    );
  }
  List<String> get followingUids =>
      followingTokens.map((e) => e.passiveUid).toList();

  List<String> get likePostIds => likePostTokens.map((e) => e.postId).toList();

  List<String> get mutePostIds => mutePostTokens.map((e) => e.postId).toList();

  List<String> get muteUids => muteUserTokens.map((e) => e.passiveUid).toList();

  bool isDeletedPost(String postId) => deletePostIds.contains(postId);
  bool isMutingPost(String postId) => mutePostIds.contains(postId);
  bool isMutingUser(String uid) => muteUids.contains(uid);
}
