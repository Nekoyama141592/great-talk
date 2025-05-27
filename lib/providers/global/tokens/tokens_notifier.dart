import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/firestore/col_ref_core.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/tokens/report_post_token/report_post_token.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/repository/firestore_repository.dart';

part 'tokens_notifier.g.dart';

@Riverpod(keepAlive: true)
class TokensNotifier extends _$TokensNotifier {
  @override
  Future<TokensState> build() async {
    // onInitと_distributeTokensのロジックをここに統合
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      // ユーザーが認証されていない場合は初期状態で返す
      return TokensState();
    }

    final repository = FirestoreRepository();
    final tokensColRef = ColRefCore.tokens(uid);
    final res = await repository.getDocsOrNull(tokensColRef);
    final allTokensData = res?.map((doc) => doc.data()).toList() ?? [];


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
      reportPostTokens:
          allTokensData
              .where((map) => map['tokenType'] == TokenType.reportPost.name)
              .map((map) => ReportPostToken.fromJson(map))
              .toList(),
    );
  }
  // 状態を安全に更新するためのヘルパー
  void _updateState(TokensState newState) {
    state = AsyncValue.data(newState);
  }

  // 現在の状態を取得するためのゲッター (state.valueがnullの場合を考慮)
  TokensState get _currentState => state.valueOrNull ?? TokensState();

  void addDeletePostId(String postId) {
    final newState = _currentState.copyWith(
      deletePostIds: [..._currentState.deletePostIds, postId],
    );
    _updateState(newState);
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

  void addLikePost(LikePostToken likePostToken) {
    final newState = _currentState.copyWith(
      likePostTokens: [..._currentState.likePostTokens, likePostToken],
    );
    _updateState(newState);
  }

  void removeLikePost(LikePostToken likePostToken) {
    final newList =
        _currentState.likePostTokens
            .where((token) => token.postId != likePostToken.postId)
            .toList();
    final newState = _currentState.copyWith(likePostTokens: newList);
    _updateState(newState);
  }

  void addMutePost(MutePostToken mutePostToken) {
    final newState = _currentState.copyWith(
      mutePostTokens: [..._currentState.mutePostTokens, mutePostToken],
    );
    _updateState(newState);
  }

  void removeMutePost(MutePostToken mutePostToken) {
    final newList =
        _currentState.mutePostTokens
            .where((token) => token.postId != mutePostToken.postId)
            .toList();
    final newState = _currentState.copyWith(mutePostTokens: newList);
    _updateState(newState);
  }

  void addMuteUser(MuteUserToken muteUserToken) {
    final newState = _currentState.copyWith(
      muteUserTokens: [..._currentState.muteUserTokens, muteUserToken],
    );
    _updateState(newState);
  }

  void removeMuteUser(MuteUserToken muteUserToken) {
    final newList =
        _currentState.muteUserTokens
            .where((token) => token.passiveUid != muteUserToken.passiveUid)
            .toList();
    final newState = _currentState.copyWith(muteUserTokens: newList);
    _updateState(newState);
  }

  void addReportPost(ReportPostToken reportPostToken) {
    final newState = _currentState.copyWith(
      reportPostTokens: [..._currentState.reportPostTokens, reportPostToken],
    );
    _updateState(newState);
  }



}
