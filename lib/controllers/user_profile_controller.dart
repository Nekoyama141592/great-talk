import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/abstract/profile_controller.dart';
import 'package:great_talk/model/follower/follower.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';

class UserProfileController extends ProfileController {
  UserProfileController() : super(false);
  static UserProfileController get to => Get.find<UserProfileController>();
  void onFollowPressed() async {
    if (passiveUser.value == null) {
      return;
    }
    if (passiveUser.value!.uid == currentUid()) {
      UIHelper.showFlutterToast("自分をフォローすることはできません。");
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    await _follow();
  }

  Future<void> _follow() async {
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    passiveUser(passiveUser.value!
        .copyWith(followerCount: passiveUser.value!.followerCount + plusOne));
    final followingToken = FollowingToken(
        createdAt: now,
        passiveUid: passiveUid(),
        tokenId: tokenId,
        passiveUserRef: passiveUser.value!.ref,
        tokenType: TokenType.following.name);
    CurrentUserController.to.addFollowing(followingToken);
    await repository.createToken(
        currentUid(), tokenId, followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final follower = Follower(
        activeUserRef: CurrentUserController.to.publicUser.value!.typedRef(),
        createdAt: now,
        passiveUserRef: passiveUser.value!.typedRef());
    await repository.createFollower(
        currentUid(), passiveUid(), follower.toJson());
  }

  void onUnFollowPressed() async {
    if (passiveUser.value == null) {
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    await _unfollow();
  }

  Future<void> _unfollow() async {
    passiveUser(passiveUser.value!
        .copyWith(followerCount: passiveUser.value!.followerCount + minusOne));
    final deleteToken = CurrentUserController.to.followingTokens
        .firstWhere((element) => element.passiveUid == passiveUid());
    CurrentUserController.to.removeFollowing(deleteToken);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deleteFollower(currentUid(), passiveUid());
  }
}
