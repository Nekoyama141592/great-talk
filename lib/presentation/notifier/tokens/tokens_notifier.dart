import 'dart:async';
import 'package:great_talk/core/util/tokens_util.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/core/provider/repository/database/database_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/domain/entity/database/tokens/following_token_entity/following_token_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/like_post_token_entity/like_post_token_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_post_token_entity/mute_post_token_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_user_token_entity/mute_user_token_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/following_token/following_token_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/like_post_token/like_post_token_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_user_token/mute_user_token_model.dart';
import 'package:great_talk/presentation/state/tokens/tokens_state.dart';

part 'tokens_notifier.g.dart';

@Riverpod(keepAlive: true)
class TokensNotifier extends _$TokensNotifier {
  @override
  Future<TokensState> build() async {
    final user = ref.watch(authProvider);
    if (user == null || user.isAnonymous) {
      return TokensState();
    }

    final repository = ref.watch(databaseRepositoryProvider);
    final uid = user.uid;
    final tokens = await repository.getTokens(uid);

    return TokensState.fromModel(tokens);
  }

  void _updateState(TokensState newState) {
    state = AsyncValue.data(newState);
  }

  TokensState get _currentState => state.valueOrNull ?? TokensState();

  String addDeletePostId(String postId) {
    final newList = TokensUtil.addToTokenList(
      _currentState.deletePostIds,
      postId,
    );
    final newState = _currentState.copyWith(deletePostIds: newList);
    _updateState(newState);
    return postId;
  }

  String removeDeletePostId(String postId) {
    final newList = [..._currentState.deletePostIds]..remove(postId);
    final newState = _currentState.copyWith(deletePostIds: newList);
    _updateState(newState);
    return postId;
  }

  FollowingTokenEntity addFollowing(String passiveUid) {
    final followingToken = FollowingTokenModel.fromUid(passiveUid);
    final followingTokenEntity = FollowingTokenEntity.fromModel(followingToken);
    final newList = TokensUtil.addToTokenList(
      _currentState.followingTokens,
      followingTokenEntity,
    );
    final newState = _currentState.copyWith(followingTokens: newList);
    _updateState(newState);
    return followingTokenEntity;
  }

  FollowingTokenEntity? removeFollowing(String uid) {
    final result = TokensUtil.removeByPassiveUid(
      _currentState.followingTokens,
      uid,
      (token) => token.passiveUid,
    );
    if (!result.wasRemoved) return null;
    final newState = _currentState.copyWith(followingTokens: result.newList);
    _updateState(newState);
    return result.removedToken;
  }

  LikePostTokenEntity? addLikePost(String currentUid, PostEntity post) {
    final token = LikePostTokenModel.fromPost(
      post.postId,
      post.uid,
      currentUid,
    );
    final tokenEntity = LikePostTokenEntity.fromModel(token);
    final newList = TokensUtil.addToTokenList(
      _currentState.likePostTokens,
      tokenEntity,
    );
    final newState = _currentState.copyWith(likePostTokens: newList);
    _updateState(newState);
    return tokenEntity;
  }

  LikePostTokenEntity? removeLikePost(String postId) {
    final result = TokensUtil.removeByPostId(
      _currentState.likePostTokens,
      postId,
      (token) => token.postId,
    );
    if (!result.wasRemoved) return null;
    final newState = _currentState.copyWith(likePostTokens: result.newList);
    _updateState(newState);
    return result.removedToken;
  }

  MutePostTokenEntity? addMutePost(PostEntity post) {
    final currentUid = ref.read(authUidProvider);
    if (currentUid == null) return null;
    final token = MutePostTokenModel.fromPost(post.postId, currentUid);
    final tokenEntity = MutePostTokenEntity.fromModel(token);
    final newList = TokensUtil.addToTokenList(
      _currentState.mutePostTokens,
      tokenEntity,
    );
    final newState = _currentState.copyWith(mutePostTokens: newList);
    _updateState(newState);
    return tokenEntity;
  }

  void removeMutePost(MutePostTokenEntity mutePostToken) {
    final result = TokensUtil.removeSpecificToken(
      _currentState.mutePostTokens,
      mutePostToken,
    );
    final newState = _currentState.copyWith(mutePostTokens: result.newList);
    _updateState(newState);
  }

  MuteUserTokenEntity? addMuteUser(PostEntity post) {
    final currentUid = ref.read(authUidProvider);
    if (currentUid == null) return null;
    final token = MuteUserTokenModel.fromPost(currentUid, post.uid);
    final tokenEntity = MuteUserTokenEntity.fromModel(token);
    final newList = TokensUtil.addToTokenList(
      _currentState.muteUserTokens,
      tokenEntity,
    );
    final newState = _currentState.copyWith(muteUserTokens: newList);
    _updateState(newState);
    return tokenEntity;
  }

  MuteUserTokenEntity? removeMuteUser(String passiveUid) {
    final result = TokensUtil.removeByPassiveUid(
      _currentState.muteUserTokens,
      passiveUid,
      (token) => token.passiveUid,
    );
    if (!result.wasRemoved) return null;
    final newState = _currentState.copyWith(muteUserTokens: result.newList);
    _updateState(newState);
    return result.removedToken;
  }
}
