import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
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
  final Rx<Post?> rxPost = Rx(null);

  void onPostCardPressed(Post post) {
    rxPost(post);
    Get.toNamed('/chat/users/${post.typedPoster().uid}/posts/${post.postId}');
  }

  void onReportButtonPressed(BuildContext context) {
    final posterUid = Get.parameters['uid']!;
    if (returnIsOriginalContents(posterUid) || currentUid() == posterUid) {
      return;
    }
    if (CurrentUserController.to.isNotVerified()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    showCupertinoModalPopup(
        context: context,
        builder: (innerContext) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () => _reportPost(innerContext),
                    child: const BasicBoldText("投稿を報告")),
                CupertinoActionSheetAction(
                    onPressed: () => _mutePost(innerContext),
                    child: const BasicBoldText("投稿をミュート")),
                CupertinoActionSheetAction(
                    onPressed: () => _muteUser(innerContext),
                    child: const BasicBoldText("ユーザーをミュート")),
                CupertinoActionSheetAction(
                    onPressed: () => Navigator.pop(innerContext),
                    child: const BasicBoldText(cancelText)),
              ],
            ));
  }

  void _reportPost(BuildContext innerContext) {
    Navigator.pop(innerContext);
    showReportContentDialog(innerContext);
  }

  void showReportContentDialog(BuildContext context) {
    Get.dialog(
      const ReportContentsListView(),
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

  void _mutePost(BuildContext innerContext) async {
    final tokenId = randomString();
    final now = Timestamp.now();
    if (rxPost.value == null) {
      return;
    }
    final post = rxPost.value!;
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
      Get.back();
    }
  }

  void _muteUser(BuildContext innerContext) async {
    if (rxPost.value == null) {
      return;
    }
    final passiveUser = rxPost.value!.typedPoster();
    final tokenId = randomString();
    final now = Timestamp.now();
    final passiveUid = passiveUser.uid;
    final MuteUserToken muteUserToken = MuteUserToken(
        activeUid: currentUid(),
        createdAt: now,
        passiveUid: passiveUid,
        tokenId: tokenId,
        tokenType: TokenType.muteUser.name);
    CurrentUserController.to.addMuteUser(muteUserToken);
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
      Get.back();
    }
  }

  Future<void> createPostReport() async {
    if (rxPost.value == null) {
      return;
    }
    final post = rxPost.value!;
    final PostReport postReport = PostReport(
      activeUserRef: CurrentUserController.to.publicUser.value!.typedRef(),
      activeUid: currentUid(),
      createdAt: Timestamp.now(),
      others: others.value,
      postRef: post.typedRef(),
      reportContents: reportContents,
    );
    final result =
        await repository.createPostReport(post.typedRef(), postReport.toJson());
    result.when(success: (res) {
      UIHelper.showFlutterToast("報告が完了しました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("報告を完了できませんでした！");
    });
  }

  void onLikeButtonPressed(ValueNotifier<bool> isLiked, Post post) async {
    if (CurrentUserController.to.isNotVerified()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    isLiked.value = true;
    await _likePost(post);
  }

  Future<void> _likePost(Post post) async {
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

  void onUnLikeButtonPressed(ValueNotifier<bool> isLiked, Post post) async {
    if (CurrentUserController.to.isNotVerified()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    isLiked.value = false;
    await _unLikePost(post);
  }

  Future<void> _unLikePost(Post post) async {
    final String passiveUid = post.typedPoster().uid;
    final deleteToken = CurrentUserController.to.likePostTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeLikePost(deleteToken);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deletePostLike(post.typedRef(), passiveUid);
  }
}
