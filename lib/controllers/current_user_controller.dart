import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';
import 'package:great_talk/model/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/repository/firebase_auth_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/new_content.dart';

class CurrentUserController extends GetxController {
  static CurrentUserController get to => Get.find<CurrentUserController>();
  final Rx<User?> currentUser = Rx(FirebaseAuth.instance.currentUser);
  final Rx<FirestoreUser?> firestoreUser = Rx(null);

  final followingTokens = <FollowingToken>[];
  final followingUids = <String>[].obs;

  final likePostTokens = <LikePostToken>[];
  final likePostIds = <String>[].obs;

  final mutePostTokens = <MutePostToken>[];
  final mutePostIds = <String>[].obs;

  final muteUserTokens = <MuteUserToken>[];
  final muteUids = <String>[].obs;

  @override
  void onInit() async {
    await _manageFirestoreUser();
    super.onInit();
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

  Future<void> _createAnonymousUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInAnonymously();
    result.when(success: (res) {
      currentUser(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("通信が失敗しました");
    });
  }

  String currentUid() => currentUser.value!.uid;

  bool isAnonymous() => currentUser.value!.isAnonymous;

  bool isNotLoggedIn() => currentUser.value == null || isAnonymous();
  bool isLoggedIn() => !isNotLoggedIn();

  bool isValidPost(String postId) => !mutePostIds.contains(postId);
  bool isValidUser(String uid) => !muteUids.contains(uid);

  Future<void> onAppleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithApple();
    result.when(
        success: (res) async {
          await res.reload();
          currentUser(FirebaseAuth.instance.currentUser);
          await _manageFirestoreUser();
        },
        failure: () {});
  }

  Future<void> onGoogleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithGoogle();
    result.when(
        success: (res) async {
          await res.reload();
          currentUser(res);
          await _manageFirestoreUser();
        },
        failure: () {});
  }

  Future<void> _createFirestoreUserWithUser() async {
    final repository = FirestoreRepository();
    final newUser = NewContent.newUser(currentUid());
    final result = await repository.createUser(currentUid(), newUser.toJson());
    result.when(success: (_) {
      firestoreUser(newUser);
      UIHelper.showFlutterToast("ユーザーが作成されました");
    }, failure: () {
      UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
    });
  }

  Future<void> _manageFirestoreUser() async {
    if (currentUser.value == null) {
      await _createAnonymousUser();
      return;
    }
    if (currentUser.value!.isAnonymous) {
      return;
    }
    final repository = FirestoreRepository();
    final result = await repository.getCurrentUser(currentUid());
    result.when(success: (res) async {
      if (res.exists && firestoreUser.value == null) {
        // アカウントが存在するなら代入する
        firestoreUser(FirestoreUser.fromJson(res.data()!));
      } else {
        // アカウントが存在しないなら作成する
        await _createFirestoreUserWithUser();
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
    if (currentUser.value == null) {
      return CurrentAuthState.notLoggedIn;
    } else if (currentUser.value!.isAnonymous) {
      return CurrentAuthState.isAnonymous;
    } else {
      return CurrentAuthState.notLoggedIn;
    }
  }

  void onLogoutButtonPressed() {
    Get.toNamed('/logouted');
  }

  void onDeleteUserButtonPressed() {
    Get.toNamed('/userDeleted');
  }
}
