import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/firestore/col_ref_core.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/database_schema/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/tokens/report_post_token/report_post_token.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/ui_core/ui_helper.dart';

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

    // 並行してブックマークカテゴリを取得
    final categories = await _fetchBookmarkCategories(uid, repository);

    return TokensState(
      bookmarkCategoryTokens: categories,
      followingTokens: allTokensData
          .where((map) => map['tokenType'] == TokenType.following.name)
          .map((map) => FollowingToken.fromJson(map))
          .toList(),
      likePostTokens: allTokensData
          .where((map) => map['tokenType'] == TokenType.likePost.name)
          .map((map) => LikePostToken.fromJson(map))
          .toList(),
      muteUserTokens: allTokensData
          .where((map) => map['tokenType'] == TokenType.muteUser.name)
          .map((map) => MuteUserToken.fromJson(map))
          .toList(),
      mutePostTokens: allTokensData
          .where((map) => map['tokenType'] == TokenType.mutePost.name)
          .map((map) => MutePostToken.fromJson(map))
          .toList(),
      reportPostTokens: allTokensData
          .where((map) => map['tokenType'] == TokenType.reportPost.name)
          .map((map) => ReportPostToken.fromJson(map))
          .toList(),
    );
  }

  Future<List<BookmarkCategory>> _fetchBookmarkCategories(
      String uid, FirestoreRepository repository) async {
    final colRef = ColRefCore.bookmarkCategories(uid);
    final res = await repository.getDocsOrNull(colRef);
    if (res == null) return [];
    final categories =
        res.map((e) => BookmarkCategory.fromJson(e.data())).toList();
    return categories;
  }

  // 状態を安全に更新するためのヘルパー
  void _updateState(TokensState newState) {
    state = AsyncValue.data(newState);
  }
  
  // 現在の状態を取得するためのゲッター (state.valueがnullの場合を考慮)
  TokensState get _currentState => state.valueOrNull ?? TokensState();

  void addDeletePostId(String postId) {
    final newState = _currentState.copyWith(
        deletePostIds: [..._currentState.deletePostIds, postId]);
    _updateState(newState);
  }

  void addBookmarkCategory(BookmarkCategory category) {
    final newState = _currentState.copyWith(
        bookmarkCategoryTokens: [..._currentState.bookmarkCategoryTokens, category]);
    _updateState(newState);
  }

  void removeBookmarkCategory(BookmarkCategory category) {
    final newList = _currentState.bookmarkCategoryTokens
        .where((c) => c.id != category.id)
        .toList();
    final newState = _currentState.copyWith(bookmarkCategoryTokens: newList);
    _updateState(newState);
  }

  void addFollowing(FollowingToken followingToken) {
    final newState = _currentState.copyWith(
        followingTokens: [..._currentState.followingTokens, followingToken]);
    _updateState(newState);
  }

  void removeFollowing(FollowingToken followingToken) {
    final newList = _currentState.followingTokens
        .where((token) => token.passiveUid != followingToken.passiveUid)
        .toList();
    final newState = _currentState.copyWith(followingTokens: newList);
    _updateState(newState);
  }

  void addLikePost(LikePostToken likePostToken) {
    final newState = _currentState.copyWith(
        likePostTokens: [..._currentState.likePostTokens, likePostToken]);
    _updateState(newState);
  }

  void removeLikePost(LikePostToken likePostToken) {
    final newList = _currentState.likePostTokens
        .where((token) => token.postId != likePostToken.postId)
        .toList();
    final newState = _currentState.copyWith(likePostTokens: newList);
    _updateState(newState);
  }

  void addMutePost(MutePostToken mutePostToken) {
    final newState = _currentState.copyWith(
        mutePostTokens: [..._currentState.mutePostTokens, mutePostToken]);
    _updateState(newState);
  }

  void removeMutePost(MutePostToken mutePostToken) {
    final newList = _currentState.mutePostTokens
        .where((token) => token.postId != mutePostToken.postId)
        .toList();
    final newState = _currentState.copyWith(mutePostTokens: newList);
    _updateState(newState);
  }

  void addMuteUser(MuteUserToken muteUserToken) {
    final newState = _currentState.copyWith(
        muteUserTokens: [..._currentState.muteUserTokens, muteUserToken]);
    _updateState(newState);
  }

  void removeMuteUser(MuteUserToken muteUserToken) {
    final newList = _currentState.muteUserTokens
        .where((token) => token.passiveUid != muteUserToken.passiveUid)
        .toList();
    final newState = _currentState.copyWith(muteUserTokens: newList);
    _updateState(newState);
  }

  void addReportPost(ReportPostToken reportPostToken) {
    final newState = _currentState.copyWith(
        reportPostTokens: [..._currentState.reportPostTokens, reportPostToken]);
    _updateState(newState);
  }

  bool isDeletedPost(String postId) => _currentState.deletePostIds.contains(postId);
  bool isMutingPost(String postId) => _currentState.mutePostIds.contains(postId);
  bool isMutingUser(String uid) => _currentState.muteUids.contains(uid);

  Future<void> createBookmarkCategory(
    BuildContext context,
    TextEditingController inputController,
  ) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final now = Timestamp.now();
    final categoryId = randomString();
    final ref = DocRefCore.bookmarkCategory(uid, categoryId);
    final repository = FirestoreRepository();
    final newCategory = BookmarkCategory(
      createdAt: now,
      id: categoryId,
      title: inputController.text,
      image: const DetectedImage().toJson(),
      ref: ref,
      updatedAt: now,
    );
    final result = await repository.createDoc(ref, newCategory.toJson());
    result.when(
      success: (res) {
        FocusScope.of(context).unfocus();
        inputController.text = "";
        addBookmarkCategory(newCategory);
        UIHelper.showFlutterToast("カテゴリーを作成できました。");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("カテゴリーを作成できませんでした。");
      },
    );
  }

  void onBookmarkCategoryDeleteButtonPressed(BuildContext context, BookmarkCategory token) {
    UIHelper.cupertinoAlertDialog(
      "このカテゴリーを削除しますが、よろしいですか？",
      () => _deleteBookmarkCategory(context, token),
    );
  }

  Future<void> _deleteBookmarkCategory(BuildContext context, BookmarkCategory token) async {
    final repository = FirestoreRepository();
    final result = await repository.deleteDoc(token.ref);
    result.when(
      success: (_) {
        Navigator.of(context).pop(); // Get.back()の代替
        removeBookmarkCategory(token);
        UIHelper.showFlutterToast("カテゴリーを削除できました。");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("カテゴリーを削除できませんでした。");
      },
    );
  }
}