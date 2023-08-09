import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/post_like/post_like.dart';
import 'package:great_talk/model/post_mute/post_mute.dart';
import 'package:great_talk/model/post_report/post_report.dart';
import 'package:great_talk/model/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/user_mute/user_mute.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/views/screen/refresh_screen/components/report_contents_list_view.dart';

class PostsController extends GetxController with CurrentUserMixin {
  static PostsController get to => Get.find<PostsController>();
  final repository = FirestoreRepository();
  final others = "".obs;
  final reportContents = <String>[].obs;

  void onReportButtonPressed(BuildContext context, Post post) {
    showCupertinoModalPopup(
        context: context,
        builder: (innerContext) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () => reportPost(innerContext, post),
                    child: const BasicBoldText("投稿を報告")),
                CupertinoActionSheetAction(
                    onPressed: () => mutePost(innerContext, post),
                    child: const BasicBoldText("投稿をミュート")),
                CupertinoActionSheetAction(
                    onPressed: () => muteUser(innerContext, post.typedPoster()),
                    child: const BasicBoldText("ユーザーをミュート")),
                CupertinoActionSheetAction(
                    onPressed: () => Navigator.pop(innerContext),
                    child: const BasicBoldText(cancelText)),
              ],
            ));
  }

  void reportPost(BuildContext innerContext, Post post) {
    Navigator.pop(innerContext);
    showReportContentDialog(innerContext, post);
  }

  void showReportContentDialog(BuildContext context, Post post) {
    Get.dialog(
      ReportContentsListView(
        post: post,
      ),
    );
  }

  void onReportContentTapped(String content) {
    if (!reportContents.contains(content)) {
      reportContents.add(content);
      reportContents([...reportContents]);
    } else {
      reportContents.remove(content);
      reportContents([...reportContents]);
    }
  }

  void mutePost(BuildContext innerContext, Post post) async {
    final tokenId = randomString();
    final now = Timestamp.now();
    final postId = post.postId;
    final postRef = post.typedRef();
    final MutePostToken mutePostToken = MutePostToken(
        activeUid: currentUid(),
        createdAt: now,
        postId: postId,
        postRef: postRef,
        tokenId: tokenId,
        tokenType: TokenType.mutePost.name);
    CurrentUserController.to.addMutePost(mutePostToken);
    await repository.createToken(currentUid(), tokenId, mutePostToken.toJson());
    final PostMute postMute = PostMute(
        activeUid: currentUid(),
        createdAt: now,
        postId: postId,
        postRef: postRef);
    await repository.createPostMute(
        post.typedRef(), currentUid(), postMute.toJson());
    if (innerContext.mounted) {
      Navigator.pop(innerContext);
    }
  }

  void muteUser(BuildContext innerContext, PublicUser passiveUser) async {
    final tokenId = randomString();
    final now = Timestamp.now();
    final passiveUid = passiveUser.uid;
    final MuteUserToken muteUserToken = MuteUserToken(
        activeUid: currentUid(),
        createdAt: now,
        passiveUid: passiveUid,
        tokenId: tokenId,
        tokenType: TokenType.muteUser.name);
    await repository.createToken(currentUid(), tokenId, muteUserToken.toJson());
    final UserMute userMute = UserMute(
        activeUserRef: CurrentUserController.to.publicUser.value!.typedRef(),
        activeUid: currentUid(),
        createdAt: now,
        passiveUid: passiveUid,
        passiveUserRef: passiveUser.typedRef());
    await repository.createUserMute(
        passiveUid, currentUid(), userMute.toJson());
    if (innerContext.mounted) {
      Navigator.pop(innerContext);
    }
  }

  Future<void> createPostReport(Post post) async {
    final PostReport postReport = PostReport(
        activeUserRef: CurrentUserController.to.publicUser.value!.typedRef(),
        activeUid: currentUid(),
        createdAt: Timestamp.now(),
        others: others.value,
        postRef: post.typedRef(),
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
    await repository.createPostLike(postRef, currentUid(), postLike.toJson());
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
