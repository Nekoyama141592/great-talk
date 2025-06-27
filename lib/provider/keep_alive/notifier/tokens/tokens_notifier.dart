import 'dart:async';
import 'package:collection/collection.dart';
import 'package:great_talk/domain/entity/database_schema/post/post.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/domain/entity/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/domain/entity/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/domain/entity/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/domain/entity/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/presentation/state/tokens/tokens_state.dart';

part 'tokens_notifier.g.dart';

@Riverpod(keepAlive: true)
class TokensNotifier extends _$TokensNotifier {
  @override
  Future<TokensState> build() async {
    final user = ref.watch(streamAuthProvider).value;
    if (user == null || user.isAnonymous) {
      return TokensState();
    }

    final repository = ref.watch(databaseRepositoryProvider);
    final uid = user.uid;
    final allTokensData = await repository.getTokens(uid);

    return TokensState(
      followingTokens:
          allTokensData
              .where((map) => map['tokenType'] == TokenType.following.name)
              .map((map) => FollowingToken.fromJson(map))
              .toList(),
      likePostTokens:
          allTokensData
              .where((map) => map['tokenType'] == TokenType.likePost.name)
              .map((map) => LikePostToken.fromJson(map))
              .toList(),
      muteUserTokens:
          allTokensData
              .where((map) => map['tokenType'] == TokenType.muteUser.name)
              .map((map) => MuteUserToken.fromJson(map))
              .toList(),
      mutePostTokens:
          allTokensData
              .where((map) => map['tokenType'] == TokenType.mutePost.name)
              .map((map) => MutePostToken.fromJson(map))
              .toList(),
    );
  }

  void _updateState(TokensState newState) {
    state = AsyncValue.data(newState);
  }

  TokensState get _currentState => state.valueOrNull ?? TokensState();

  String addDeletePostId(String postId) {
    final newState = _currentState.copyWith(
      deletePostIds: [..._currentState.deletePostIds, postId],
    );
    _updateState(newState);
    return postId;
  }

  String removeDeletePostId(String postId) {
    final newState = _currentState.copyWith(
      deletePostIds: [..._currentState.deletePostIds]..remove(postId),
    );
    _updateState(newState);
    return postId;
  }

  FollowingToken addFollowing(String passiveUid) {
    final followingToken = FollowingToken.fromUid(passiveUid);
    final newState = _currentState.copyWith(
      followingTokens: [..._currentState.followingTokens, followingToken],
    );
    _updateState(newState);
    return followingToken;
  }

  FollowingToken? removeFollowing(String uid) {
    final deleteToken = state.value?.followingTokens.firstWhereOrNull(
      (element) => element.passiveUid == uid,
    );
    if (deleteToken == null) return null;
    final newList =
        _currentState.followingTokens
            .where((token) => token.tokenId == deleteToken.tokenId)
            .toList();
    final newState = _currentState.copyWith(followingTokens: newList);
    _updateState(newState);
    return deleteToken;
  }

  LikePostToken? addLikePost(String currentUid, Post post) {
    final token = LikePostToken.fromPost(post, currentUid);
    final newState = _currentState.copyWith(
      likePostTokens: [..._currentState.likePostTokens, token],
    );
    _updateState(newState);
    return token;
  }

  LikePostToken? removeLikePost(String postId) {
    final deleteToken = state.value?.likePostTokens.firstWhereOrNull(
      (element) => element.postId == postId,
    );
    if (deleteToken == null) return null;
    final newList =
        _currentState.likePostTokens
            .where((token) => token.postId != postId)
            .toList();
    final newState = _currentState.copyWith(likePostTokens: newList);
    _updateState(newState);
    return deleteToken;
  }

  MutePostToken? addMutePost(Post post) {
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) return null;
    final token = MutePostToken.fromPost(post, currentUid);
    final newState = _currentState.copyWith(
      mutePostTokens: [..._currentState.mutePostTokens, token],
    );
    _updateState(newState);
    return token;
  }

  void removeMutePost(MutePostToken mutePostToken) {
    final newList =
        _currentState.mutePostTokens
            .where((token) => token.postId != mutePostToken.postId)
            .toList();
    final newState = _currentState.copyWith(mutePostTokens: newList);
    _updateState(newState);
  }

  MuteUserToken? addMuteUser(Post post) {
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) return null;
    final token = MuteUserToken.fromPost(currentUid, post);
    final newState = _currentState.copyWith(
      muteUserTokens: [..._currentState.muteUserTokens, token],
    );
    _updateState(newState);
    return token;
  }

  MuteUserToken? removeMuteUser(String passiveUid) {
    final deleteToken = ref
        .read(tokensNotifierProvider)
        .value
        ?.muteUserTokens
        .firstWhereOrNull((e) => e.passiveUid == passiveUid);
    if (deleteToken == null) return null;
    final newList =
        _currentState.muteUserTokens
            .where((token) => token.passiveUid != deleteToken.passiveUid)
            .toList();
    final newState = _currentState.copyWith(muteUserTokens: newList);
    _updateState(newState);
    return deleteToken;
  }
}
