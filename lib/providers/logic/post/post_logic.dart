import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/providers/logic/router/router_logic.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
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
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_logic.g.dart';

@Riverpod(keepAlive: true)
FirestoreRepository firestoreRepository(Ref ref) => FirestoreRepository();

@Riverpod(keepAlive: true)
AWSS3Repository awsS3Repository(Ref ref) => AWSS3Repository();

@riverpod
class PostLogic extends _$PostLogic {
  @override
  void build() {} // state()は使わないのでvoidでOK

  FirestoreRepository get _firestoreRepository =>
      ref.read(firestoreRepositoryProvider);
  AWSS3Repository get _awsS3Repository => ref.read(awsS3RepositoryProvider);
  TokensState? get _tokensState => ref.read(tokensNotifierProvider).value;
  TokensNotifier get _tokensNotifier =>
      ref.read(tokensNotifierProvider.notifier);
  String? get _currentUid => FirebaseAuth.instance.currentUser?.uid;

  void onPostCardPressed(BuildContext context,Post post) {
    RouterLogic.pushPath(context, ChatPage.generatePath(post.uid, post.postId));
  }

  void onReportButtonPressed(BuildContext context, Post post) {
    final posterUid = post.uid;
    final currentUid = _currentUid;
    if (currentUid == null) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    if (currentUid == posterUid) {
      UIHelper.showFlutterToast("自分の投稿を報告したり、ミュートしたりすることはできません。");
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

  Future<void> _mutePost(
    BuildContext innerContext,
    Post post,
    String currentUid,
  ) async {
    if (_tokensState?.mutePostIds.contains(post.postId) ?? false) {
      UIHelper.showFlutterToast("すでにこの投稿をミュートしています");
      Navigator.pop(innerContext);
      return;
    }
    final tokenId = randomString();
    final now = Timestamp.now();
    final postId = post.postId;
    final postRef = post.typedRef();
    final mutePostToken = MutePostToken(
      activeUid: currentUid,
      createdAt: now,
      postId: postId,
      postRef: postRef,
      tokenId: tokenId,
      tokenType: TokenType.mutePost.name,
    );
    _tokensNotifier.addMutePost(mutePostToken);
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.createDoc(tokenRef, mutePostToken.toJson());

    final postMute = PostMute(
      activeUid: currentUid,
      createdAt: now,
      postId: postId,
      postRef: postRef,
    );
    final postMuteRef = DocRefCore.postMute(postRef, currentUid);
    await _firestoreRepository.createDoc(postMuteRef, postMute.toJson());

    if (innerContext.mounted) {
      Navigator.pop(innerContext); // Close ActionSheet
      if (Navigator.canPop(innerContext)) {
        Navigator.pop(innerContext); // Close post detail page etc.
      }
    }
  }

  Future<void> _muteUser(
    BuildContext innerContext,
    Post post,
    String currentUid,
  ) async {
    final passiveUid = post.uid;
    if (_tokensState?.muteUids.contains(passiveUid) ?? false) {
      UIHelper.showFlutterToast("すでにこのユーザーをミュートしています");
      Navigator.pop(innerContext);
      return;
    }
    final tokenId = randomString();
    final now = Timestamp.now();
    final passiveUserRef = DocRefCore.user(passiveUid);
    final muteUserToken = MuteUserToken(
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      passiveUserRef: passiveUserRef,
      tokenId: tokenId,
      tokenType: TokenType.muteUser.name,
    );
    _tokensNotifier.addMuteUser(muteUserToken);
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.createDoc(tokenRef, muteUserToken.toJson());

    final userMute = UserMute(
      activeUserRef: DocRefCore.user(currentUid),
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      passiveUserRef: passiveUserRef,
    );
    final userMuteRef = DocRefCore.userMute(passiveUid, currentUid);
    await _firestoreRepository.createDoc(userMuteRef, userMute.toJson());
    if (innerContext.mounted) {
      Navigator.pop(innerContext); // Close ActionSheet
      if (Navigator.canPop(innerContext)) {
        Navigator.pop(innerContext); // Close post detail page etc.
      }
    }
  }

  void onLikeButtonPressed(ValueNotifier<Post> copyPost, Post post) async {
    final currentUid = _currentUid;
    if (currentUid == null) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    copyPost.value = copyPost.value.copyWith(
      likeCount: copyPost.value.likeCount + 1,
    );
    await _likePost(post, currentUid);
  }

  Future<void> _likePost(Post post, String currentUid) async {
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
    _tokensNotifier.addLikePost(likePostToken);
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.createDoc(tokenRef, likePostToken.toJson());

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

  void onUnLikeButtonPressed(ValueNotifier<Post> copyPost, Post post) async {
    final currentUid = _currentUid;
    if (currentUid == null) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    copyPost.value = copyPost.value.copyWith(
      likeCount: copyPost.value.likeCount - 1,
    );
    await _unLikePost(post, currentUid);
  }

  Future<void> _unLikePost(Post post, String currentUid) async {
    final deleteToken = _tokensState?.likePostTokens.firstWhere(
      (element) => element.postId == post.postId,
    );
    if (deleteToken == null) return;

    _tokensNotifier.removeLikePost(deleteToken);
    final tokenId = deleteToken.tokenId;
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    await _firestoreRepository.deleteDoc(tokenRef);
    final postRef = post.typedRef();
    final postLikeRef = DocRefCore.postLike(postRef, currentUid);
    await _firestoreRepository.deleteDoc(postLikeRef);
  }

  void deletePost(BuildContext context,Post deletePost) {
    UIHelper.cupertinoAlertDialog(context,"投稿を削除しますが本当によろしいですか?", () async {
      RouterLogic.back(context);
      final result = await _firestoreRepository.deleteDoc(deletePost.ref);
      await result.when(
        success: (_) async {
          _tokensNotifier.addDeletePostId(deletePost.postId);
          RouterLogic.back(context);
          await _removePostImage(deletePost.typedImage());
          UIHelper.showErrorFlutterToast("投稿を削除しました。");
        },
        failure: (e) {
          UIHelper.showErrorFlutterToast("投稿を削除することができませんでした。");
        },
      );
    });
  }

  Future<void> _removePostImage(DetectedImage image) async {
    final request = DeleteObjectRequest(object: image.value);
    await _awsS3Repository.deleteObject(request);
  }
}
