import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/core/firestore/col_ref_core.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/infrastructure/credential_composer.dart';
import 'package:great_talk/model/database_schema/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/rest_api/delete_object/request/delete_object_request.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/model/database_schema/tokens/report_post_token/report_post_token.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firebase_auth_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:great_talk/views/auth/logouted_page.dart';
import 'package:great_talk/views/auth/user_deleted_page.dart';

class CurrentUserController extends GetxController {
  static CurrentUserController get to => Get.find<CurrentUserController>();
  final Rx<User?> rxAuthUser = Rx(FirebaseAuth.instance.currentUser);
  final Rx<PublicUser?> rxPublicUser = Rx(null);
  final Rx<PrivateUser?> rxPrivateUser = Rx(null);
  final Rx<Uint8List?> rxUint8list = Rx(null);

  @override
  void onInit() async {
    await _manageUserInfo();
    super.onInit();
  }

  Future<void> _createAnonymousUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInAnonymously();
    result.when(success: (res) => rxAuthUser(res), failure: (e) {});
  }

  String currentUid() => rxAuthUser.value?.uid ?? '';

  bool isAdmin() => rxPrivateUser.value?.isAdmin ?? false;
  bool isOfficial() => rxPublicUser.value?.isOfficial ?? false;

  bool isAnonymous() => rxAuthUser.value!.isAnonymous;

  bool isNotLoggedIn() => rxAuthUser.value == null || isAnonymous();
  bool isLoggedIn() => !isNotLoggedIn();

  bool _hasPublicUser() => rxPublicUser.value != null;
  bool hasNoPublicUser() => !_hasPublicUser();

  bool isNotVerified() => !rxAuthUser.value!.emailVerified;

  Future<void> onAppleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithApple();
    await result.when(success: onLoginSuccess, failure: (e) {});
  }

  Future<void> onGoogleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithGoogle();
    await result.when(success: onLoginSuccess, failure: (e) {});
  }

  Future<void> onLoginSuccess(User user) async {
    Get.back();
    UIHelper.showFlutterToast("ログインに成功しました");
    await user.reload();
    rxAuthUser(user);
    await _manageUserInfo();
  }

  Future<void> _createPublicUser() async {
    final repository = FirestoreRepository();
    final newUser = NewContent.newUser(currentUid());
    final ref = DocRefCore.user(currentUid());
    final json = newUser.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(
      success: (_) {
        rxPublicUser(newUser);
        UIHelper.showFlutterToast("ユーザーが作成されました");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
      },
    );
  }

  Future<void> _createPrivateUser() async {
    final repository = FirestoreRepository();
    final newPrivateUser = NewContent.newPrivateUser(currentUid());
    final ref = DocRefCore.privateUser(currentUid());
    final json = newPrivateUser.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(
      success: (_) {
        rxPrivateUser(newPrivateUser);
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
      },
    );
  }

  Future<void> _manageUserInfo() async {
    if (rxAuthUser.value == null) {
      await _createAnonymousUser();
      return;
    }
    if (rxAuthUser.value!.isAnonymous) {
      return;
    }
    await _getPublicUser();
    await _getPrivateUser();
  }

  Future<void> _getPublicUser() async {
    final repository = FirestoreRepository();
    final ref = DocRefCore.user(currentUid());
    final result = await repository.getDoc(ref);
    await result.when(
      success: (res) async {
        final data = res.data();
        if (res.exists && data != null) {
          // アカウントが存在するなら代入する
          final user = PublicUser.fromJson(data);
          rxPublicUser(user);
          final bucketName = user.typedImage().bucketName;
          final fileName = user.typedImage().value;
          if (bucketName.isNotEmpty && fileName.isNotEmpty) {
            final image = await FileUtility.getS3Image(bucketName, fileName);
            rxUint8list(image);
          }
        } else {
          // アカウントが存在しないなら作成する
          await _createPublicUser();
        }
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      },
    );
  }

  Future<void> _getPrivateUser() async {
    final repository = FirestoreRepository();
    final ref = DocRefCore.privateUser(currentUid());
    final result = await repository.getDoc(ref);
    await result.when(
      success: (res) async {
        final data = res.data();
        if (res.exists && data != null) {
          // アカウントが存在するなら代入する
          rxPrivateUser(PrivateUser.fromJson(data));
        } else {
          // アカウントが存在しないなら作成する
          await _createPrivateUser();
        }
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      },
    );
  }

  String currentAuthStateString() {
    final state = currentAuthState();
    switch (state) {
      case CurrentAuthState.isAnonymous:
        return "匿名ログイン中";
      case CurrentAuthState.loggedIn:
        return "ログイン中";
      case CurrentAuthState.notLoggedIn:
        return "ログイン中";
    }
  }

  CurrentAuthState currentAuthState() {
    if (rxAuthUser.value == null) {
      return CurrentAuthState.notLoggedIn;
    } else if (rxAuthUser.value!.isAnonymous) {
      return CurrentAuthState.isAnonymous;
    } else {
      return CurrentAuthState.notLoggedIn;
    }
  }

  void onLogoutButtonPressed() async {
    UIHelper.cupertinoAlertDialog("ログアウトしますが本当によろしいですか？", _signOut);
  }

  Future<void> _signOut() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signOut();
    result.when(
      success: (_) {
        Get.toNamed(LogoutedPage.path);
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("ログアウトできませんでした");
      },
    );
  }

  Future<void> reauthenticateWithAppleToDelete() async {
    final credential = await CredentialComposer.appleCredential();
    await _reauthenticateToDelete(credential);
  }

  Future<void> reauthenticateWithGoogleToDelete() async {
    final credential = await CredentialComposer.googleCredential();
    await _reauthenticateToDelete(credential);
  }

  Future<void> _reauthenticateToDelete(AuthCredential credential) async {
    final repository = FirebaseAuthRepository();
    final result = await repository.reauthenticateWithCredential(
      rxAuthUser.value!,
      credential,
    );
    result.when(
      success: (_) {
        _showDeleteUserDialog();
      },
      failure: (e) {},
    );
  }

  void _showDeleteUserDialog() {
    UIHelper.cupertinoAlertDialog("ユーザーを削除しますが本当によろしいですか？", _deletePublicUser);
  }

  Future<void> _deletePublicUser() async {
    final user = rxPublicUser.value;
    if (user == null) return;
    final repository = FirestoreRepository();
    final ref = user.typedRef();
    final result = await repository.deleteDoc(ref);
    await result.when(
      success: (_) async {
        _deleteAuthUser();
        _removeImage();
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データベースからユーザーを削除できませんでした");
      },
    );
  }

  Future<void> _deleteAuthUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.deleteUser(rxAuthUser.value!);
    result.when(
      success: (_) {
        Get.toNamed(UserDeletedPage.path);
      },
      failure: (e) {},
    );
  }

  Future<void> _removeImage() async {
    final publicUser = CurrentUserController.to.rxPublicUser.value;
    if (publicUser == null) return;
    final fileName = publicUser.typedImage().value;
    final request = DeleteObjectRequest(object: fileName);
    await AWSS3Repository().deleteObject(request);
  }

  void updateUser(String userName, String bio, String fileName) async {
    final user = rxPublicUser.value!;
    final result = user.copyWith(
      bio: user.typedBio().copyWith(value: bio).toJson(),
      userName: user.typedUserName().copyWith(value: userName).toJson(),
      image: user.typedImage().copyWith(value: fileName).toJson(),
    );
    rxPublicUser(result);
    final image = await FileUtility.getS3Image(
      user.typedImage().bucketName,
      fileName,
    );
    rxUint8list(image);
  }
}

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
