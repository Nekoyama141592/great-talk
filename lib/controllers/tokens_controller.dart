import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/strings.dart';
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
  // Tokens
  final deletePostIds = <String>[].obs; // 投稿の削除時に一時的に保存する.

  final bookmarkCategoryTokens = <BookmarkCategory>[].obs;
  final followingTokens = <FollowingToken>[].obs;
  List<String> get followingUids =>
      followingTokens.map((e) => e.passiveUid).toList();

  final likePostTokens = <LikePostToken>[].obs;
  List<String> get likePostIds => likePostTokens.map((e) => e.postId).toList();

  final mutePostTokens = <MutePostToken>[].obs;
  List<String> get mutePostIds => mutePostTokens.map((e) => e.postId).toList();

  final muteUserTokens = <MuteUserToken>[].obs;
  List<String> get muteUids => muteUserTokens.map((e) => e.passiveUid).toList();

  final reportPostTokens = <ReportPostToken>[].obs;
  List<String> get reportPostIds =>
      reportPostTokens.map((e) => e.postId).toList();
  @override
  void onInit() async {
    await _distributeTokens();
    await _fetchBookmarkCategories();
    super.onInit();
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

        // Followings
        followingTokens.value =
            allTokensData
                .where((map) => map['tokenType'] == TokenType.following.name)
                .map((map) => FollowingToken.fromJson(map))
                .toList();

        // LikePosts
        likePostTokens.value =
            allTokensData
                .where((map) => map['tokenType'] == TokenType.likePost.name)
                .map((map) => LikePostToken.fromJson(map))
                .toList();

        // MuteUsers
        muteUserTokens.value =
            allTokensData
                .where((map) => map['tokenType'] == TokenType.muteUser.name)
                .map((map) => MuteUserToken.fromJson(map))
                .toList();

        // MutePosts
        mutePostTokens.value =
            allTokensData
                .where((map) => map['tokenType'] == TokenType.mutePost.name)
                .map((map) => MutePostToken.fromJson(map))
                .toList();

        // ReportPosts
        reportPostTokens.value =
            allTokensData
                .where((map) => map['tokenType'] == TokenType.reportPost.name)
                .map((map) => ReportPostToken.fromJson(map))
                .toList();
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
        // This is already an immutable operation.
        bookmarkCategoryTokens.value =
            res.map((e) => BookmarkCategory.fromJson(e.data())).toList();
      },
      failure: (e) {},
    );
  }

  // 投稿の削除時に外部から呼び出す.
  void addDeletePostId(String postId) {
    deletePostIds.value = [...deletePostIds, postId];
  }

  void addBookmarkCategory(BookmarkCategory category) {
    bookmarkCategoryTokens.value = [...bookmarkCategoryTokens, category];
  }

  void removeBookmarkCategory(BookmarkCategory category) {
    bookmarkCategoryTokens.value =
        bookmarkCategoryTokens.where((c) => c.id != category.id).toList();
  }

  void addFollowing(FollowingToken followingToken) {
    followingTokens.value = [...followingTokens, followingToken];
  }

  void removeFollowing(FollowingToken followingToken) {
    followingTokens.value =
        followingTokens
            .where((token) => token.passiveUid != followingToken.passiveUid)
            .toList();
  }

  void addLikePost(LikePostToken likePostToken) {
    likePostTokens.value = [...likePostTokens, likePostToken];
  }

  void removeLikePost(LikePostToken likePostToken) {
    likePostTokens.value =
        likePostTokens
            .where((token) => token.postId != likePostToken.postId)
            .toList();
  }

  void addMutePost(MutePostToken mutePostToken) {
    mutePostTokens.value = [...mutePostTokens, mutePostToken];
  }

  void removeMutePost(MutePostToken mutePostToken) {
    mutePostTokens.value =
        mutePostTokens
            .where((token) => token.postId != mutePostToken.postId)
            .toList();
  }

  void addMuteUser(MuteUserToken muteUserToken) {
    muteUserTokens.value = [...muteUserTokens, muteUserToken];
  }

  void removeMuteUser(MuteUserToken muteUserToken) {
    muteUserTokens.value =
        muteUserTokens
            .where((token) => token.passiveUid != muteUserToken.passiveUid)
            .toList();
  }

  void addReportPost(ReportPostToken reportPostToken) {
    reportPostTokens.value = [...reportPostTokens, reportPostToken];
  }

  bool isDeletedPost(String postId) => deletePostIds.contains(postId);
  bool isMutingPost(String postId) => mutePostIds.contains(postId);
  bool isMutingUser(String uid) => muteUids.contains(uid);

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
        removeBookmarkCategory(token);
        UIHelper.showFlutterToast("カテゴリーを削除できました。");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("カテゴリーを削除できませんでした。");
      },
    );
  }
}
