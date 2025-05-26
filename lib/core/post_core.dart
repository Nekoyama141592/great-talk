import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/post_like/post_like.dart';
import 'package:great_talk/model/database_schema/post_mute/post_mute.dart';
import 'package:great_talk/model/rest_api/delete_object/request/delete_object_request.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/views/chat/chat_page.dart';

class PostCore {
  static final _firestoreRepository = FirestoreRepository();
  static final _awsS3Repository = AWSS3Repository();

  static void onPostCardPressed(Post post) {
    Get.toNamed(ChatPage.generatePath(post.uid, post.postId));
  }

  // UIDをコピーする関数.
  static Future<void> onPostCardLongPressed(Post post) async {
    if (!CurrentUserController.to.isAdmin()) return;
    final text = "UID\n${post.uid}\n投稿の画像${post.typedImage().value}";
    final data = ClipboardData(text: text);
    await Clipboard.setData(data);
    UIHelper.showFlutterToast("三つの情報をコピーしました");
  }

  static void onReportButtonPressed(
    BuildContext context,
    Post post,
    String currentUid,
  ) {
    final posterUid = Get.parameters['uid']!;
    if (currentUid == posterUid) {
      UIHelper.showFlutterToast("自分の投稿を報告したり、ミュートしたりすることはできません。");
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    showCupertinoModalPopup(
      context: context,
      builder:
          (innerContext) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () => _mutePost(innerContext, post, currentUid),
                child: const BasicBoldText("投稿をミュート"),
              ),
              CupertinoActionSheetAction(
                onPressed: () => _muteUser(innerContext, post, currentUid),
                child: const BasicBoldText("ユーザーをミュート"),
              ),
              CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(innerContext),
                child: const BasicBoldText(cancelText),
              ),
            ],
          ),
    );
  }

  static void _mutePost(
    BuildContext innerContext,
    Post post,
    String currentUid,
  ) async {
    if (TokensController.to.mutePostIds.contains(post.postId)) {
      UIHelper.showFlutterToast("すでにこの投稿をミュートしています");
      Navigator.pop(innerContext);
      return;
    }
    final tokenId = randomString();
    final now = Timestamp.now();
    final postId = post.postId;
    final postRef = post.typedRef();
    final MutePostToken mutePostToken = MutePostToken(
      activeUid: currentUid,
      createdAt: now,
      postId: postId,
      postRef: postRef,
      tokenId: tokenId,
      tokenType: TokenType.mutePost.name,
    );
    TokensController.to.addMutePost(mutePostToken);
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.createDoc(tokenRef, mutePostToken.toJson());
    final PostMute postMute = PostMute(
      activeUid: currentUid,
      createdAt: now,
      postId: postId,
      postRef: postRef,
    );
    final postMuteRef = DocRefCore.postMute(postRef, currentUid);
    await _firestoreRepository.createDoc(postMuteRef, postMute.toJson());
    if (innerContext.mounted) {
      Navigator.pop(innerContext);
      Get.back();
    }
  }

  static void _muteUser(
    BuildContext innerContext,
    Post post,
    String currentUid,
  ) async {
    final passiveUid = post.uid;
    if (TokensController.to.muteUids.contains(passiveUid)) {
      UIHelper.showFlutterToast("すでにこのユーザーをミュートしています");
      Navigator.pop(innerContext);
      return;
    }
    final tokenId = randomString();
    final now = Timestamp.now();
    final passiveUserRef = DocRefCore.user(passiveUid);
    final MuteUserToken muteUserToken = MuteUserToken(
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      passiveUserRef: passiveUserRef,
      tokenId: tokenId,
      tokenType: TokenType.muteUser.name,
    );
    TokensController.to.addMuteUser(muteUserToken);
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.createDoc(tokenRef, muteUserToken.toJson());
    final UserMute userMute = UserMute(
      activeUserRef: CurrentUserController.to.rxPublicUser.value!.typedRef(),
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      passiveUserRef: passiveUserRef,
    );
    final userMuteRef = DocRefCore.userMute(passiveUid, currentUid);
    await _firestoreRepository.createDoc(userMuteRef, userMute.toJson());
    if (innerContext.mounted) {
      Navigator.pop(innerContext);
      Get.back();
    }
  }

  static void onLikeButtonPressed(
    ValueNotifier<Post> copyPost,
    ValueNotifier<bool> isLiked,
    Post post,
    String currentUid,
  ) async {
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    copyPost.value = copyPost.value.copyWith(
      likeCount: copyPost.value.likeCount + 1,
    );
    isLiked.value = true;
    await _likePost(post, currentUid);
  }

  static Future<void> _likePost(Post post, String currentUid) async {
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    final String passiveUid = post.uid;
    final postRef = post.ref;
    final postId = post.postId;
    final likePostToken = LikePostToken(
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      postRef: postRef,
      postId: postId,
      tokenId: tokenId,
      tokenType: TokenType.likePost.name,
    );
    TokensController.to.addLikePost(likePostToken);
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.createDoc(tokenRef, likePostToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final postLike = PostLike(
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      postRef: postRef,
      postId: postId,
    );
    final postLikeRef = DocRefCore.postLike(postRef, currentUid);
    await _firestoreRepository.createDoc(postLikeRef, postLike.toJson());
  }

  static void onUnLikeButtonPressed(
    ValueNotifier<Post> copyPost,
    ValueNotifier<bool> isLiked,
    Post post,
    String currentUid,
  ) async {
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    copyPost.value = copyPost.value.copyWith(
      likeCount: copyPost.value.likeCount - 1,
    );
    isLiked.value = false;
    await _unLikePost(post, currentUid);
  }

  static Future<void> _unLikePost(Post post, String currentUid) async {
    final String passiveUid = post.uid;
    final deleteToken = TokensController.to.likePostTokens.firstWhere(
      (element) => element.passiveUid == passiveUid,
    );
    TokensController.to.removeLikePost(deleteToken);
    final tokenId = deleteToken.tokenId;
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.deleteDoc(tokenRef);
    final postRef = post.typedRef();
    final activeUid = deleteToken.activeUid;
    final postLikeRef = DocRefCore.postLike(postRef, activeUid);
    await _firestoreRepository.deleteDoc(postLikeRef);
  }

  static void deletePost(Post deletePost) {
    UIHelper.cupertinoAlertDialog("投稿を削除しますが本当によろしいですか?", () async {
      Get.back();
      final result = await _firestoreRepository.deleteDoc(deletePost.ref);
      await result.when(
        success: (_) async {
          TokensController.to.addDeletePostId(deletePost.postId);
          await _removePostImage(deletePost.typedImage());
          Get.back();
          UIHelper.showErrorFlutterToast("投稿を削除しました。");
        },
        failure: (e) {
          UIHelper.showErrorFlutterToast("投稿を削除することができませんでした。");
        },
      );
    });
  }

  static Future<void> _removePostImage(DetectedImage image) async {
    final request = DeleteObjectRequest(object: image.value);
    await _awsS3Repository.deleteObject(request);
  }
}
