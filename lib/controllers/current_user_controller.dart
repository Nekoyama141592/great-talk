import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';
import 'package:great_talk/repository/firebase_auth_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class CurrentUserController extends GetxController {
  static CurrentUserController get to => Get.find<CurrentUserController>();
  final Rx<User?> currentUser = Rx(FirebaseAuth.instance.currentUser);
  final Rx<FirestoreUser?> firestoreUser = Rx(null);

  final followingTokens = <FollowingToken>[]; // Viewの変更には関与しないので観測しない.
  final followingUids = <String>[].obs;

  @override
  void onInit() async {
    await _createAnonymousUser();
    super.onInit();
  }

  void addFollowingUid(FollowingToken followingToken) {
    followingTokens.add(followingToken);
    followingUids.add(followingToken.passiveUid);
    followingUids([...followingUids]);
  }

  void removeFollowingUid(FollowingToken followingToken) {
    followingTokens.remove(followingToken);
    followingUids.remove(followingToken.passiveUid);
    followingUids([...followingUids]);
  }

  Future<void> _createAnonymousUser() async {
    if (currentUser.value == null) {
      final repository = FirebaseAuthRepository();
      final result = await repository.signInAnonymously();
      result.when(success: (res) {
        currentUser(res);
      }, failure: () {
        UIHelper.showFlutterToast("通信が失敗しました");
      });
    }
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
          await _manageFirestoreUser(res);
        },
        failure: () {});
  }

  Future<void> onGoogleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithGoogle();
    result.when(
        success: (res) async {
          await res.reload();
          currentUser(FirebaseAuth.instance.currentUser);
          await _manageFirestoreUser(res);
        },
        failure: () {});
  }

  Future<void> _createFirestoreUserWithUser(User user) async {
    final repository = FirestoreRepository();
    final now = Timestamp.now();
    final newUser = FirestoreUser(
      accountName: "",
      createdAt: now,
      bio: {},
      blockCount: 0,
      ethAddress: '',
      followerCount: 0,
      followingCount: 0,
      isAdmin: false,
      isNFTicon: false,
      isOfficial: false,
      isSuspended: false,
      muteCount: 0,
      postCount: 0,
      links: [],
      nftIconInfo: {},
      ref: FirestoreQueries.userQuery(user.uid),
      reportCount: 0,
      score: 0,
      searchToken: {},
      uid: user.uid,
      updatedAt: now,
      userImage: {},
      userName: {},
      walletAddresses: [],
    );
    final result = await repository.createUser(user.uid, newUser.toJson());
    result.when(success: (_) {
      firestoreUser(newUser);
      UIHelper.showFlutterToast("ユーザーが作成されました");
    }, failure: () {
      UIHelper.showFlutterToast("データベースにユーザーを作成できませんでした");
    });
  }

  Future<void> _manageFirestoreUser(User user) async {
    final repository = FirestoreRepository();
    final result = await repository.getUser(user.uid);
    result.when(success: (res) async {
      if (res.exists) {
        // アカウントが存在するなら代入する
        firestoreUser(FirestoreUser.fromJson(res.data()!));
      } else {
        // アカウントが存在しないなら作成する
        await _createFirestoreUserWithUser(user);
      }
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }
}
