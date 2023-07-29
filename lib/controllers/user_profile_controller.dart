import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/interfaces/new_docs_interface.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/follower/follower.dart';
import 'package:great_talk/model/tokens/following_token/following_token.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class UserProfileController extends DocsController
    with CurrentUidMixin
    implements NewDocsInterface {
  final _repository = FirestoreRepository();
  String passiveUid = "";
  @override
  Future<void> fetchDocs() async {
    final result = await _repository.getUserPostsByNewest(passiveUid);
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading() async {
    final result =
        await _repository.getMoreUserPostsByNewest(passiveUid, docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onRefresh() async {
    final result =
        await _repository.getNewUserPostsByNewest(passiveUid, docs.first);
    result.when(success: (res) {
      insertAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  Future<void> follow() async {
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    final followingToken = FollowingToken(
        createdAt: now,
        passiveUid: passiveUid,
        tokenId: tokenId,
        tokenType: TokenType.following.name);
    CurrentUserController.to.addFollowingUid(followingToken);
    await _repository.createToken(
        currentUid(), tokenId, followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final follower = Follower(
        createdAt: now, followedUid: passiveUid, followerUid: currentUid());
    await _repository.createFollower(
        currentUid(), passiveUid, follower.toJson());
  }

  Future<void> unfollow() async {
    final deleteToken = CurrentUserController.to.followingTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeFollowingUid(deleteToken);
    await _repository.deleteToken(currentUid(), deleteToken.tokenId);
    await _repository.deleteFollower(currentUid(), passiveUid);
  }
}
