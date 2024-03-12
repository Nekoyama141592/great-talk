import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/abstract/profile_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/model/follower/follower.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/file_utility.dart';

class UserProfileController extends ProfileController {
  static UserProfileController get to => Get.find<UserProfileController>();
  @override
  String passiveUid() => Get.parameters['uid']!;
  @override
  Future<void> init() async {
    await _getPassiveUser();
    return super.init();
  }

  @override
  void setQuery() async {
    query = QueryCore.userPostsByNewest(passiveUid());
  }

  Future<void> _getPassiveUser() async {
    final repository = FirestoreRepository();
    final ref = DocRefCore.user(passiveUid());
    final result = await repository.getDoc(ref);
    result.when(success: (res) {
      if (res.exists) {
        rxPassiveUser(PublicUser.fromJson(res.data()!));
      }
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
    final user = rxPassiveUser.value;
    if (user == null) return;
    final detectedImage = user.typedImage();
    final s3Image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    rxUint8list(s3Image);
  }

  void onFollowPressed() async {
    if (rxPassiveUser.value == null) {
      return;
    }
    if (rxPassiveUser.value!.uid == currentUid()) {
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
    rxPassiveUser(rxPassiveUser.value!
        .copyWith(followerCount: rxPassiveUser.value!.followerCount + plusOne));
    final followingToken = FollowingToken(
        createdAt: now,
        passiveUid: passiveUid(),
        tokenId: tokenId,
        passiveUserRef: rxPassiveUser.value!.ref,
        tokenType: TokenType.following.name);
    CurrentUserController.to.addFollowing(followingToken);
    final tokenRef = DocRefCore.token(currentUid(), tokenId);
    await repository.createDoc(tokenRef, followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final follower = Follower(
        activeUserRef: CurrentUserController.to.rxPublicUser.value!.typedRef(),
        createdAt: now,
        passiveUserRef: rxPassiveUser.value!.typedRef());
    final followerRef = DocRefCore.follower(currentUid(), passiveUid());
    await repository.createDoc(followerRef, follower.toJson());
  }

  void onUnFollowPressed() async {
    if (rxPassiveUser.value == null) {
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
    rxPassiveUser(rxPassiveUser.value!.copyWith(
        followerCount: rxPassiveUser.value!.followerCount + minusOne));
    final deleteToken = CurrentUserController.to.followingTokens
        .firstWhere((element) => element.passiveUid == passiveUid());
    CurrentUserController.to.removeFollowing(deleteToken);
    final tokenRef = DocRefCore.token(currentUid(), deleteToken.tokenId);
    await repository.deleteDoc(tokenRef);
    final followerRef = DocRefCore.follower(currentUid(), passiveUid());
    await repository.deleteDoc(followerRef);
  }
}
