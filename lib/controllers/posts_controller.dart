import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/post_like/post_like.dart';
import 'package:great_talk/model/post_mute/post_mute.dart';
import 'package:great_talk/model/post_report/post_report.dart';
import 'package:great_talk/model/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/tokens/report_post_token/report_post_token.dart';
import 'package:great_talk/model/user_mute/user_mute.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/views/realtime_res_page/realtime_res_page.dart';
import 'package:great_talk/views/screen/refresh_screen/components/report_contents_list_view.dart';

class PostsController extends GetxController with CurrentUserMixin {
  static PostsController get to => Get.find<PostsController>();
  final repository = FirestoreRepository();
  final others = "".obs;
  final reportContents = <String>[].obs;
  final Rx<Post?> rxPost = Rx(null);

  void onPostCardPressed(Post post) {
    PurchasesController.to.restorePurchases();
    rxPost(post);
    Get.toNamed(RealtimeResPage.generatePath(post.posterUid, post.postId));
  }

  // UIDをコピーする関数.
  Future<void> onPostCardLongPressed(Post post) async {
    if (!CurrentUserController.to.isAdmin()) return;
    final publicUser = post.typedPoster();
    final text =
        "UID\n${publicUser.uid}\nユーザーの画像\n${publicUser.typedImage().value}\n投稿の画像${post.typedImage().value}";
    final data = ClipboardData(text: text);
    await Clipboard.setData(data);
    UIHelper.showFlutterToast("三つの情報をコピーしました");
  }

  void onReportButtonPressed(BuildContext context) {
    final posterUid = Get.parameters['uid']!;
    if (returnIsOriginalContents(posterUid) || currentUid() == posterUid) {
      UIHelper.showFlutterToast("自分の投稿を報告したり、ミュートしたりすることはできません。");
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    showCupertinoModalPopup(
        context: context,
        builder: (innerContext) => CupertinoActionSheet(
              actions: [
                // 報告機能は、非表示にしておく
                // CupertinoActionSheetAction(
                //     onPressed: () => _reportPost(innerContext),
                //     child: const BasicBoldText("投稿を報告")),
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

  // void _reportPost(BuildContext innerContext) {
  //   if (rxPost.value == null) {
  //     return;
  //   }
  //   final post = rxPost.value!;
  //   if (CurrentUserController.to.reportPostIds.contains(post.postId)) {
  //     UIHelper.showFlutterToast("すでにこの投稿を報告しています");
  //     Navigator.pop(innerContext);
  //     return;
  //   }
  //   Navigator.pop(innerContext);
  //   showReportContentDialog(innerContext);
  // }

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
    if (rxPost.value == null) {
      return;
    }
    final post = rxPost.value!;
    if (CurrentUserController.to.mutePostIds.contains(post.postId)) {
      UIHelper.showFlutterToast("すでにこの投稿をミュートしています");
      Navigator.pop(innerContext);
      return;
    }
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
      Get.back();
    }
  }

  void _muteUser(BuildContext innerContext) async {
    if (rxPost.value == null) {
      return;
    }
    final passiveUser = rxPost.value!.typedPoster();
    if (CurrentUserController.to.muteUids.contains(passiveUser.uid)) {
      UIHelper.showFlutterToast("すでにこのユーザーをミュートしています");
      Navigator.pop(innerContext);
      return;
    }
    final tokenId = randomString();
    final now = Timestamp.now();
    final passiveUid = passiveUser.uid;
    final MuteUserToken muteUserToken = MuteUserToken(
        activeUid: currentUid(),
        createdAt: now,
        passiveUid: passiveUid,
        passiveUserRef: passiveUser.ref,
        tokenId: tokenId,
        tokenType: TokenType.muteUser.name);
    CurrentUserController.to.addMuteUser(muteUserToken);
    await repository.createToken(currentUid(), tokenId, muteUserToken.toJson());
    final UserMute userMute = UserMute(
        activeUserRef: CurrentUserController.to.rxPublicUser.value!.typedRef(),
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

  void onOkCreatePostReportButtonPressed() async {
    if (reportContents.isEmpty) {
      return;
    }
    await _createPostReport().then((value) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    });
  }

  Future<void> _createPostReport() async {
    final post = rxPost.value!;
    final tokenId = randomString();
    final now = Timestamp.now();
    final postId = post.postId;
    final postRef = post.typedRef();
    final ReportPostToken reportPostToken = ReportPostToken(
        activeUid: currentUid(),
        createdAt: now,
        postId: postId,
        postRef: postRef,
        tokenId: tokenId,
        tokenType: TokenType.reportPost.name);
    CurrentUserController.to.addReportPost(reportPostToken);
    await repository.createToken(
        currentUid(), tokenId, reportPostToken.toJson());
    final PostReport postReport = PostReport(
      activeUserRef: CurrentUserController.to.rxPublicUser.value!.typedRef(),
      activeUid: currentUid(),
      createdAt: Timestamp.now(),
      others: others.value,
      postRef: post.typedRef(),
      reportContents: reportContents,
    );
    final result = await repository.createPostReport(
        post.typedRef(), currentUid(), postReport.toJson());
    result.when(success: (res) {
      UIHelper.showFlutterToast("報告が完了しました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("報告を完了できませんでした！");
    });
  }

  void onLikeButtonPressed(ValueNotifier<Post> copyPost,
      ValueNotifier<bool> isLiked, Post post) async {
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    copyPost.value =
        copyPost.value.copyWith(likeCount: copyPost.value.likeCount + 1);
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

  void onUnLikeButtonPressed(ValueNotifier<Post> copyPost,
      ValueNotifier<bool> isLiked, Post post) async {
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    copyPost.value =
        copyPost.value.copyWith(likeCount: copyPost.value.likeCount - 1);
    isLiked.value = false;
    await _unLikePost(post);
  }

  Future<void> _unLikePost(Post post) async {
    final String passiveUid = post.typedPoster().uid;
    final deleteToken = CurrentUserController.to.likePostTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeLikePost(deleteToken);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deletePostLike(post.typedRef(), deleteToken.activeUid);
  }

  void deletePost(Post deletePost) {
    UIHelper.cupertinoAlertDialog("投稿を削除しますが本当によろしいですか?", () async {
      Get.back();
      final repository = FirestoreRepository();
      final result = await repository.deletePost(deletePost.ref);
      result.when(success: (_) {
        CurrentUserController.to.addDeletePostId(deletePost.postId);
        _removePostImage(deletePost.typedImage());
        Get.back();
        UIHelper.showErrorFlutterToast("投稿を削除しました。");
      }, failure: () {
        UIHelper.showErrorFlutterToast("投稿を削除することができませんでした。");
      });
    });
  }

  Future<void> _removePostImage(DetectedImage image) async =>
      await AWSS3Repository.instance
          .removeObject(image.bucketName, image.value);
}
