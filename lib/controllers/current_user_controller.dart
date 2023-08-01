import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';
import 'package:great_talk/model/tokens/like_post_token/like_post_token.dart';
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
  final likePostUids = <String>[].obs;

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
    likePostUids.add(likePostToken.passiveUid);
    likePostUids([...likePostUids]);
  }

  void removeLikePost(LikePostToken likePostToken) {
    likePostTokens.remove(likePostToken);
    likePostUids.remove(likePostToken.passiveUid);
    likePostUids([...likePostUids]);
  }

  Future<void> _createAnonymousUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInAnonymously();
    result.when(success: (res) {
      currentUser(res);
    }, failure: () {
      UIHelper.showFlutterToast("通信が失敗しました");
    });
  }

  String currentUid() => currentUser.value!.uid;

  bool isAnonymous() => currentUser.value!.isAnonymous;

  bool isNotLoggedIn() => currentUser.value == null || isAnonymous();

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
      UIHelper.showFlutterToast("データベースにユーザーを作成できませんでした");
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
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }
}
