import 'dart:async';
import 'package:collection/collection.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';

part 'tokens_notifier.g.dart';

@Riverpod(keepAlive: true)
class TokensNotifier extends _$TokensNotifier {
  @override
  Future<TokensState> build() async {
    final user = ref.watch(streamAuthProvider).value;
    if (user == null || user.isAnonymous) {
      return TokensState();
    }

    final repository = ref.read(firestoreRepositoryProvider);
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

  void addFollowing(FollowingToken followingToken) {
    final newState = _currentState.copyWith(
      followingTokens: [..._currentState.followingTokens, followingToken],
    );
    _updateState(newState);
  }

  void removeFollowing(FollowingToken followingToken) {
    final newList =
        _currentState.followingTokens
            .where((token) => token.passiveUid != followingToken.passiveUid)
            .toList();
    final newState = _currentState.copyWith(followingTokens: newList);
    _updateState(newState);
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

  void removeMuteUser(MuteUserToken muteUserToken) {
    final newList =
        _currentState.muteUserTokens
            .where((token) => token.passiveUid != muteUserToken.passiveUid)
            .toList();
    final newState = _currentState.copyWith(muteUserTokens: newList);
    _updateState(newState);
  }
}
