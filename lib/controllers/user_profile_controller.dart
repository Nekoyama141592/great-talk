import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/profile_controller.dart';
import 'package:great_talk/model/follower/follower.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';

class UserProfileController extends ProfileController {
  UserProfileController() : super(false);
  static UserProfileController get to => Get.find<UserProfileController>();
  Future<void> follow() async {
    if (passiveUser.value == null) {
      return;
    }
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    passiveUser(passiveUser.value!
        .copyWith(followerCount: passiveUser.value!.followerCount + plusOne));
    final followingToken = FollowingToken(
        createdAt: now,
        passiveUid: passiveUid(),
        tokenId: tokenId,
        tokenType: TokenType.following.name);
    CurrentUserController.to.addFollowing(followingToken);
    await repository.createToken(
        currentUid(), tokenId, followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final follower = Follower(
        createdAt: now, followedUid: passiveUid(), followerUid: currentUid());
    await repository.createFollower(
        currentUid(), passiveUid(), follower.toJson());
  }

  Future<void> unfollow() async {
    if (passiveUser.value == null) {
      return;
    }
    passiveUser(passiveUser.value!
        .copyWith(followerCount: passiveUser.value!.followerCount + minusOne));
    final deleteToken = CurrentUserController.to.followingTokens
        .firstWhere((element) => element.passiveUid == passiveUid());
    CurrentUserController.to.removeFollowing(deleteToken);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deleteFollower(currentUid(), passiveUid());
  }
}
