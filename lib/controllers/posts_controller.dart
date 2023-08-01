import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/post_like/post_like.dart';
import 'package:great_talk/model/post_report/post_report.dart';
import 'package:great_talk/model/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class PostsController extends GetxController with CurrentUserMixin {
  static PostsController get to => Get.find<PostsController>();
  final repository = FirestoreRepository();
  final others = "".obs;
  final reportContents = <String>[].obs;
  Future<void> createPostReport(Post post) async {
    final PostReport postReport = PostReport(
        activeUid: currentUid(),
        createdAt: Timestamp.now(),
        others: others.value,
        reportContents: reportContents,
        post: post);
    final result =
        await repository.createPostReport(post.typedRef(), postReport.toJson());
    result.when(success: (res) {
      UIHelper.showFlutterToast("報告が完了しました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("報告を完了できませんでした！");
    });
  }

  Future<void> likePost(Post post) async {
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    final String passiveUid = post.typedPoster().uid;
    final postRef = post.ref;
    final postId = post.postId;
    final likePostToken = LikePostToken(
        activeUid: currentUid(),
        createdAt: now,
        passiveUid: passiveUid,
        postRef: postRef,
        postId: postId,
        tokenId: tokenId,
        tokenType: TokenType.likePost.name);
    CurrentUserController.to.addLikePost(likePostToken);
    await repository.createToken(currentUid(), tokenId, likePostToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final postLike = PostLike(
        activeUid: currentUid(),
        createdAt: now,
        passiveUid: passiveUid,
        postRef: postRef,
        postId: postId);
    await repository.createPostLike(postRef, tokenId, postLike.toJson());
  }

  Future<void> unLikePost(Post post) async {
    final String passiveUid = post.typedPoster().uid;
    final deleteToken = CurrentUserController.to.likePostTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeLikePost(deleteToken);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deleteFollower(currentUid(), passiveUid);
  }
}
