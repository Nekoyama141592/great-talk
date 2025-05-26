import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/core/firestore/col_ref_core.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/database_schema/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';

import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/tokens/report_post_token/report_post_token.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class TokensController extends GetxController {
  static TokensController get to => Get.find<TokensController>();
  final state = TokensState().obs;

  @override
  void onInit() async {
    super.onInit();
    await _distributeTokens();
    await _fetchBookmarkCategories();
  }

  Future<void> _distributeTokens() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final repository = FirestoreRepository();
    final tokensColRef = ColRefCore.tokens(uid);
    final result = await repository.getDocs(tokensColRef);
    result.when(
      success: (res) {
        final allTokensData = res.map((doc) => doc.data()).toList();

        // 修正後: stateをcopyWithで一度に更新する
        state.value = state.value.copyWith(
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
      },
      failure: (e) {
        // Handle failure, e.g., show an error message
      },
    );
  }

  Future<void> _fetchBookmarkCategories() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final colRef = ColRefCore.bookmarkCategories(uid);
    final repository = FirestoreRepository();
    final result = await repository.getDocs(colRef);
    result.when(
      success: (res) {
        final categories =
            res.map((e) => BookmarkCategory.fromJson(e.data())).toList();
        // 修正後: stateをcopyWithで更新
        state.value = state.value.copyWith(bookmarkCategoryTokens: categories);
      },
      failure: (e) {},
    );
  }

  // 以下、各メソッドをstateを更新するように修正

  void addDeletePostId(String postId) {
    // 修正後: stateをcopyWithで更新
    state.value = state.value
        .copyWith(deletePostIds: [...state.value.deletePostIds, postId]);
  }

  void addBookmarkCategory(BookmarkCategory category) {
    // 修正後: stateをcopyWithで更新
    state.value = state.value.copyWith(bookmarkCategoryTokens: [
      ...state.value.bookmarkCategoryTokens,
      category
    ]);
  }

  void removeBookmarkCategory(BookmarkCategory category) {
    // 修正後: stateをcopyWithで更新
    final newList = state.value.bookmarkCategoryTokens
        .where((c) => c.id != category.id)
        .toList();
    state.value = state.value.copyWith(bookmarkCategoryTokens: newList);
  }

  void addFollowing(FollowingToken followingToken) {
    // 修正後: stateをcopyWithで更新
    state.value = state.value.copyWith(
        followingTokens: [...state.value.followingTokens, followingToken]);
  }

  void removeFollowing(FollowingToken followingToken) {
    // 修正後: stateをcopyWithで更新
    final newList = state.value.followingTokens
        .where((token) => token.passiveUid != followingToken.passiveUid)
        .toList();
    state.value = state.value.copyWith(followingTokens: newList);
  }

  void addLikePost(LikePostToken likePostToken) {
    // 修正後: stateをcopyWithで更新
    state.value = state.value.copyWith(
        likePostTokens: [...state.value.likePostTokens, likePostToken]);
  }

  void removeLikePost(LikePostToken likePostToken) {
    // 修正後: stateをcopyWithで更新
    final newList = state.value.likePostTokens
        .where((token) => token.postId != likePostToken.postId)
        .toList();
    state.value = state.value.copyWith(likePostTokens: newList);
  }

  void addMutePost(MutePostToken mutePostToken) {
    // 修正後: stateをcopyWithで更新
    state.value = state.value
        .copyWith(mutePostTokens: [...state.value.mutePostTokens, mutePostToken]);
  }

  void removeMutePost(MutePostToken mutePostToken) {
    // 修正後: stateをcopyWithで更新
    final newList = state.value.mutePostTokens
        .where((token) => token.postId != mutePostToken.postId)
        .toList();
    state.value = state.value.copyWith(mutePostTokens: newList);
  }

  void addMuteUser(MuteUserToken muteUserToken) {
    // 修正後: stateをcopyWithで更新
    state.value = state.value
        .copyWith(muteUserTokens: [...state.value.muteUserTokens, muteUserToken]);
  }

  void removeMuteUser(MuteUserToken muteUserToken) {
    // 修正後: stateをcopyWithで更新
    final newList = state.value.muteUserTokens
        .where((token) => token.passiveUid != muteUserToken.passiveUid)
        .toList();
    state.value = state.value.copyWith(muteUserTokens: newList);
  }

  void addReportPost(ReportPostToken reportPostToken) {
    // 修正後: stateをcopyWithで更新
    state.value = state.value.copyWith(
        reportPostTokens: [...state.value.reportPostTokens, reportPostToken]);
  }

  // 修正後: stateから直接値を取得するように修正
  bool isDeletedPost(String postId) => state.value.deletePostIds.contains(postId);
  bool isMutingPost(String postId) => state.value.mutePostIds.contains(postId);
  bool isMutingUser(String uid) => state.value.muteUids.contains(uid);

  void createBookmarkCategory(
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
        // 状態更新メソッドを呼び出す
        addBookmarkCategory(newCategory);
        UIHelper.showFlutterToast("カテゴリーを作成できました。");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("カテゴリーを作成できませんでした。");
      },
    );
  }

  void onBookmarkCategoryDeleteButtonPressed(BookmarkCategory token) {
    UIHelper.cupertinoAlertDialog(
      "このカテゴリーを削除しますが、よろしいですか？",
      () => _deleteBookmarkCategory(token),
    );
  }

  void _deleteBookmarkCategory(BookmarkCategory token) async {
    final repository = FirestoreRepository();
    final result = await repository.deleteDoc(token.ref);
    result.when(
      success: (_) {
        Get.back();
        // 状態更新メソッドを呼び出す
        removeBookmarkCategory(token);
        UIHelper.showFlutterToast("カテゴリーを削除できました。");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("カテゴリーを削除できませんでした。");
      },
    );
  }
}