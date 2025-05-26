import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/database_schema/follower/follower.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/file_utility.dart';

class UserProfileController extends DocsController {
  UserProfileController() : super(DocsType.userProfiles);
  static UserProfileController get to => Get.find<UserProfileController>();
  @override
  Future<void> init() async {
    await _getPassiveUser();
    return super.init();
  }

  Future<void> _getPassiveUser() async {
    final repository = FirestoreRepository();
    final ref = DocRefCore.user(passiveUid());
    final result = await repository.getDoc(ref);
    result.when(success: (res) {
      if (res.exists) {
        state.value = state.value.copyWith(passiveUser: PublicUser.fromJson(res.data()!));
      }
    }, failure: (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
    final user = state.value.passiveUser;
    if (user == null) return;
    final detectedImage = user.typedImage();
    final s3Image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    state.value = state.value.copyWith(uint8list: s3Image);
  }

  void onFollowPressed() async {
    if (state.value.passiveUser == null) {
      return;
    }
    if (state.value.passiveUser!.uid == currentUid()) {
      UIHelper.showFlutterToast("自分をフォローすることはできません。");
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です。");
      return;
    }
    if (CurrentUserController.to.followingUids.length >= followLimit) {
      UIHelper.showFlutterToast("フォローできるのは$followLimit人までです。");
      return;
    }
    await _follow();
  }

  Future<void> _follow() async {
    final repository = FirestoreRepository();
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    final newUser = state.value.passiveUser!
        .copyWith(followerCount: state.value.passiveUser!.followerCount + plusOne);
    state.value = state.value.copyWith(passiveUser: newUser);
    final followingToken = FollowingToken(
        createdAt: now,
        passiveUid: passiveUid(),
        tokenId: tokenId,
        passiveUserRef: state.value.passiveUser!.ref,
        tokenType: TokenType.following.name);
    CurrentUserController.to.addFollowing(followingToken);
    final tokenRef = DocRefCore.token(currentUid(), tokenId);
    await repository.createDoc(tokenRef, followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final follower = Follower(
        activeUserRef: CurrentUserController.to.rxPublicUser.value!.typedRef(),
        createdAt: now,
        passiveUserRef: state.value.passiveUser!.typedRef());
    final followerRef = DocRefCore.follower(currentUid(), passiveUid());
    await repository.createDoc(followerRef, follower.toJson());
  }

  void onUnFollowPressed() async {
    if (state.value.passiveUser == null) {
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    await _unfollow();
  }

  Future<void> _unfollow() async {
    final repository = FirestoreRepository();
    final newUser = state.value.passiveUser!.copyWith(
        followerCount: state.value.passiveUser!.followerCount + minusOne);
    state.value = state.value.copyWith(passiveUser: newUser);
    final deleteToken = CurrentUserController.to.followingTokens
        .firstWhere((element) => element.passiveUid == passiveUid());
    CurrentUserController.to.removeFollowing(deleteToken);
    final tokenRef = DocRefCore.token(currentUid(), deleteToken.tokenId);
    await repository.deleteDoc(tokenRef);
    final followerRef = DocRefCore.follower(currentUid(), passiveUid());
    await repository.deleteDoc(followerRef);
  }

  bool isMyProfile() => passiveUid() == currentUid();
}
