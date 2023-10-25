import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/my_profile_controller.dart';
import 'package:great_talk/infrastructure/credential_composer.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';
import 'package:great_talk/model/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/private_user/private_user.dart';
import 'package:great_talk/model/tokens/report_post_token/report_post_token.dart';
import 'package:great_talk/repository/firebase_auth_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/new_content.dart';

class CurrentUserController extends GetxController {
  static CurrentUserController get to => Get.find<CurrentUserController>();
  final Rx<User?> authUser = Rx(FirebaseAuth.instance.currentUser);
  final Rx<PublicUser?> publicUser = Rx(null);
  final Rx<PrivateUser?> privateUser = Rx(null);

  final deletePostIds = <String>[].obs; // 投稿の削除時に一時的に保存する.

  final bookmarkCategoryTokens = <BookmarkCategory>[].obs;
  final followingTokens = <FollowingToken>[];
  final followingUids = <String>[].obs;

  final likePostTokens = <LikePostToken>[];
  final likePostIds = <String>[].obs;

  final mutePostTokens = <MutePostToken>[];
  final mutePostIds = <String>[].obs;

  final muteUserTokens = <MuteUserToken>[];
  final muteUids = <String>[].obs;

  final reportPostTokens = <ReportPostToken>[];
  final reportPostIds = <String>[].obs;

  @override
  void onInit() async {
    await _manageUserInfo();
    await _distributeTokens();
    await _fetchBookmarkCategories();
    super.onInit();
  }

  Future<void> _distributeTokens() async {
    if (hasNoPublicUser()) {
      return;
    }
    final repository = FirestoreRepository();
    final result = await repository.getTokens(currentUid());
    result.when(
        success: (res) {
          for (final token in res) {
            final Map<String, dynamic> tokenMap = token.data();
            final TokenType tokenType =
                TokenType.values.byName(tokenMap['tokenType']);
            switch (tokenType) {
              case TokenType.following:
                final FollowingToken followingToken =
                    FollowingToken.fromJson(tokenMap);
                addFollowing(followingToken);
                break;
              case TokenType.likePost:
                final LikePostToken likePostToken =
                    LikePostToken.fromJson(tokenMap);
                addLikePost(likePostToken);
                break;
              case TokenType.muteUser:
                final MuteUserToken muteUserToken =
                    MuteUserToken.fromJson(tokenMap);
                addMuteUser(muteUserToken);
                break;
              case TokenType.mutePost:
                final MutePostToken mutePostToken =
                    MutePostToken.fromJson(tokenMap);
                addMutePost(mutePostToken);
                break;
              case TokenType.reportPost:
                final ReportPostToken reportPostToken =
                    ReportPostToken.fromJson(tokenMap);
                addReportPost(reportPostToken);
                break;
            }
          }
        },
        failure: () {});
  }

  Future<void> _fetchBookmarkCategories() async {
    final user = privateUser.value;
    if (user == null) {
      return;
    }
    final qshot = await FirestoreQueries.bookmarkCategoriesColRef(user).get();
    bookmarkCategoryTokens(
        qshot.docs.map((e) => BookmarkCategory.fromJson(e.data())).toList());
  }

  // 投稿の削除時に外部から呼び出す.
  void addDeletePostId(String postId) {
    deletePostIds.add(postId);
    deletePostIds([...deletePostIds]);
  }

  void addBookmarkCategory(BookmarkCategory category) {
    bookmarkCategoryTokens.add(category);
  }

  void removeBookmarkCategory(BookmarkCategory category) {
    bookmarkCategoryTokens.remove(category);
  }

  void addFollowing(FollowingToken followingToken) {
    followingTokens.add(followingToken);
    followingUids.add(followingToken.passiveUid);
    followingUids([...followingUids]);
  }

  void removeFollowing(FollowingToken followingToken) {
    followingTokens.remove(followingToken);
    followingUids.remove(followingToken.passiveUid);
    followingUids([...followingUids]);
  }

  void addLikePost(LikePostToken likePostToken) {
    likePostTokens.add(likePostToken);
    likePostIds.add(likePostToken.postId);
    likePostIds([...likePostIds]);
  }

  void removeLikePost(LikePostToken likePostToken) {
    likePostTokens.remove(likePostToken);
    likePostIds.remove(likePostToken.postId);
    likePostIds([...likePostIds]);
  }

  void addMutePost(MutePostToken mutePostToken) {
    mutePostTokens.add(mutePostToken);
    mutePostIds.add(mutePostToken.postId);
    mutePostIds([...mutePostIds]);
  }

  void removeMutePost(MutePostToken mutePostToken) {
    mutePostTokens.remove(mutePostToken);
    mutePostIds.remove(mutePostToken.postId);
    mutePostIds([...mutePostIds]);
  }

  void addMuteUser(MuteUserToken muteUserToken) {
    muteUserTokens.add(muteUserToken);
    muteUids.add(muteUserToken.passiveUid);
    muteUids([...muteUids]);
  }

  void removeMuteUer(MuteUserToken muteUserToken) {
    muteUserTokens.remove(muteUserToken);
    muteUids.remove(muteUserToken.passiveUid);
    muteUids([...muteUids]);
  }

  void addReportPost(ReportPostToken reportPostToken) {
    reportPostTokens.add(reportPostToken);
    reportPostIds.add(reportPostToken.postId);
    reportPostIds([...reportPostIds]);
  }

  Future<void> _createAnonymousUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInAnonymously();
    result.when(
        success: (res) {
          authUser(res);
        },
        failure: () {});
  }

  String currentUid() => authUser.value!.uid;

  bool isAdmin() => privateUser.value?.isAdmin ?? false;

  bool isAnonymous() => authUser.value!.isAnonymous;

  bool isNotLoggedIn() => authUser.value == null || isAnonymous();
  bool isLoggedIn() => !isNotLoggedIn();

  bool _hasPublicUser() =>
      authUser.value!.emailVerified && publicUser.value != null;
  bool hasNoPublicUser() => !_hasPublicUser();

  bool isNotVerified() => !authUser.value!.emailVerified;
  bool isDeletedPost(String postId) => deletePostIds.contains(postId);
  bool isMutingPost(String postId) => mutePostIds.contains(postId);
  bool isMutingUser(String uid) => muteUids.contains(uid);

  Future<void> onAppleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithApple();
    result.when(success: onLoginSuccess, failure: () {});
  }

  Future<void> onGoogleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithGoogle();
    result.when(success: onLoginSuccess, failure: () {});
  }

  Future<void> onLoginSuccess(User user) async {
    await user.reload();
    authUser(user);
    await _manageUserInfo();
    await MyProfileController.to.onReload();
  }

  Future<void> _createPublicUserWithUser() async {
    final repository = FirestoreRepository();
    final newUser = NewContent.newUser(currentUid());
    final result = await repository.createUser(currentUid(), newUser.toJson());
    result.when(success: (_) {
      publicUser(newUser);
      MyProfileController.to.updateProfileUserState(newUser);
      UIHelper.showFlutterToast("ユーザーが作成されました");
    }, failure: () {
      UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
    });
  }

  Future<void> _createPrivateUserWithUser() async {
    final repository = FirestoreRepository();
    final newPrivateUser = NewContent.newPrivateUser(currentUid());
    final result = await repository.createPrivateUser(
        currentUid(), newPrivateUser.toJson());
    result.when(success: (_) {
      privateUser(newPrivateUser);
    }, failure: () {
      UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
    });
  }

  Future<void> _manageUserInfo() async {
    if (authUser.value == null) {
      await _createAnonymousUser();
      return;
    }
    if (authUser.value!.isAnonymous) {
      return;
    }
    await _getPublicUser();
    await _getPrivateUser();
  }

  Future<void> _getPublicUser() async {
    final repository = FirestoreRepository();
    final result = await repository.getCurrentUser(currentUid());
    result.when(success: (res) async {
      if (res.exists && publicUser.value == null) {
        // アカウントが存在するなら代入する
        final newUser = PublicUser.fromJson(res.data()!);
        publicUser(newUser);
        MyProfileController.to.updateProfileUserState(newUser);
      } else {
        // アカウントが存在しないなら作成する
        await _createPublicUserWithUser();
      }
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
  }

  Future<void> _getPrivateUser() async {
    final repository = FirestoreRepository();
    final result = await repository.getPrivateUser(currentUid());
    result.when(success: (res) async {
      if (res.exists && privateUser.value == null) {
        // アカウントが存在するなら代入する
        privateUser(PrivateUser.fromJson(res.data()!));
      } else {
        // アカウントが存在しないなら作成する
        await _createPrivateUserWithUser();
      }
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
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
    if (authUser.value == null) {
      return CurrentAuthState.notLoggedIn;
    } else if (authUser.value!.isAnonymous) {
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
    result.when(success: (_) async {
      Get.toNamed('/logouted');
    }, failure: () {
      UIHelper.showErrorFlutterToast("ログアウトできませんでした");
    });
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
        authUser.value!, credential);
    result.when(
        success: (_) {
          _showDeleteUserDialog();
        },
        failure: () {});
  }

  void _showDeleteUserDialog() {
    UIHelper.cupertinoAlertDialog("ユーザーを削除しますが本当によろしいですか？", _deletePublicUser);
  }

  Future<void> _deletePublicUser() async {
    final repository = FirestoreRepository();
    final result = await repository.deleteUser(currentUid());
    result.when(success: (_) async {
      await _deleteAuthUser();
    }, failure: () {
      UIHelper.showErrorFlutterToast("データベースからユーザーを削除できませんでした");
    });
  }

  Future<void> _deleteAuthUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.deleteUser(authUser.value!);
    result.when(
        success: (_) async {
          Get.toNamed('/userDeleted');
        },
        failure: () {});
  }

  void updateUser(
    String userName,
    String bio,
    String fileName,
  ) async {
    final user = publicUser.value!;
    final result = user.copyWith(
        bio: user.typedBio().copyWith(value: bio).toJson(),
        userName: user.typedUserName().copyWith(value: userName).toJson(),
        image: user.typedImage().copyWith(value: fileName).toJson());
    publicUser(result);
    MyProfileController.to.updateProfileUserState(result);
  }

  void createBookmarkCategory(
      BuildContext context, TextEditingController inputController) async {
    final user = privateUser.value;
    if (user == null) return;
    final now = Timestamp.now();
    final categoryId = randomString();
    final ref = FirestoreQueries.bookmarkCategoryDocRef(user, categoryId);
    final repository = FirestoreRepository();
    final newCategory = BookmarkCategory(
        createdAt: now,
        id: categoryId,
        title: inputController.text,
        image: DetectedImage.initial().toJson(),
        ref: ref,
        updatedAt: now);
    final result = await repository.createDoc(ref, newCategory.toJson());
    result.when(success: (res) {
      FocusScope.of(context).unfocus();
      inputController.text = "";
      addBookmarkCategory(newCategory);
      UIHelper.showFlutterToast("カテゴリーを作成できました。");
    }, failure: () {
      UIHelper.showErrorFlutterToast("カテゴリーを作成できませんでした。");
    });
  }

  void onBookmarkCategoryDeleteButtonPressed(BookmarkCategory token) {
    UIHelper.cupertinoAlertDialog(
        "このカテゴリーを削除しますが、よろしいですか？", () => _deleteBookmarkCategory(token));
  }

  void _deleteBookmarkCategory(BookmarkCategory token) async {
    final user = publicUser.value;
    if (user == null) return;
    final repository = FirestoreRepository();
    final result = await repository.deleteDoc(token.ref);
    result.when(success: (_) {
      Get.back();
      removeBookmarkCategory(token);
      UIHelper.showFlutterToast("カテゴリーを削除できました。");
    }, failure: () {
      UIHelper.showErrorFlutterToast("カテゴリーを削除できませんでした。");
    });
  }
}
