import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/model/follower/follower.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserProfileController extends DocsController with CurrentUidMixin {
  UserProfileController(this.isMyProfile) : super(enablePullDown: true);
  final bool isMyProfile;
  final _repository = FirestoreRepository();
  final Rx<FirestoreUser?> passiveUser = Rx(null);
  String passiveUid() => passiveUser.value!.uid;
  @override
  Future<void> fetchDocs() async {
    if (isMyProfile) {
      passiveUser(CurrentUserController.to.firestoreUser.value);
    } else {
      await _getPassiveUser();
    }
    final result = await _repository.getUserPostsByNewest(passiveUid());
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  Future<void> _getPassiveUser() async {
    final result = await _repository.getUser(Get.parameters['uid']!);
    result.when(success: (res) {
      passiveUser(FirestoreUser.fromJson(res.data()!)); // TODO: ハンドリング
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final result =
        await _repository.getMoreUserPostsByNewest(passiveUid(), docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    final result =
        await _repository.getNewUserPostsByNewest(passiveUid(), docs.first);
    result.when(success: (res) {
      insertAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
    refreshController.refreshCompleted();
  }

  Future<void> follow() async {
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    final followingToken = FollowingToken(
        createdAt: now,
        passiveUid: passiveUid(),
        tokenId: tokenId,
        tokenType: TokenType.following.name);
    CurrentUserController.to.addFollowingUid(followingToken);
    await _repository.createToken(
        currentUid(), tokenId, followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final follower = Follower(
        createdAt: now, followedUid: passiveUid(), followerUid: currentUid());
    await _repository.createFollower(
        currentUid(), passiveUid(), follower.toJson());
  }

  Future<void> unfollow() async {
    final deleteToken = CurrentUserController.to.followingTokens
        .firstWhere((element) => element.passiveUid == passiveUid());
    CurrentUserController.to.removeFollowingUid(deleteToken);
    await _repository.deleteToken(currentUid(), deleteToken.tokenId);
    await _repository.deleteFollower(currentUid(), passiveUid());
  }
}
