import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/repository/real/on_call/on_call_repository.dart';
import 'package:great_talk/repository/result/result.dart';
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
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_logic.g.dart';

@Riverpod(keepAlive: true)
FirestoreRepository firestoreRepository(Ref ref) => FirestoreRepository();

@Riverpod(keepAlive: true)
OnCallRepository onCallRepository(Ref ref) => OnCallRepository();

@riverpod
class PostLogic extends _$PostLogic {
  @override
  void build() {} // state()は使わないのでvoidでOK

  FirestoreRepository get _firestoreRepository =>
      ref.read(firestoreRepositoryProvider);
  OnCallRepository get _onCallRepository => ref.read(onCallRepositoryProvider);
  TokensState? get _tokensState => ref.read(tokensNotifierProvider).value;
  TokensNotifier get _tokensNotifier =>
      ref.read(tokensNotifierProvider.notifier);
  String? get _currentUid => ref.read(streamAuthUidProvider).value;

  FutureResult<bool> mutePost(Post post, String currentUid) async {
    if (_tokensState?.mutePostIds.contains(post.postId) ?? false) {
      return const Result.failure('すでにこの投稿をミュートしています');
    }
    final tokenId = randomString();
    final now = Timestamp.now();
    final postId = post.postId;
    final postRef = post.typedRef();
    final tokenRef = DocRefCore.token(currentUid, tokenId);
    final mutePostToken = MutePostToken(
      activeUid: currentUid,
      createdAt: now,
      postId: postId,
      postRef: postRef,
      tokenId: tokenId,
      tokenType: TokenType.mutePost.name,
    );
    _tokensNotifier.addMutePost(mutePostToken);
    final postMuteRef = DocRefCore.postMute(postRef, currentUid);
    final postMute = PostMute(
      activeUid: currentUid,
      createdAt: now,
      postId: postId,
      postRef: postRef,
    );
    final requests = [
      FirestoreRequest(tokenRef, mutePostToken.toJson()),
      FirestoreRequest(postMuteRef, postMute.toJson()),
    ];
    return await _firestoreRepository.createDocs(requests);
  }

  FutureResult<bool> muteUser(Post post, String currentUid) async {
    final passiveUid = post.uid;
    if (_tokensState?.muteUids.contains(passiveUid) ?? false) {
      return const Result.failure('すでにこのユーザーをミュートしています');
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
    final userMute = UserMute(
      activeUserRef: DocRefCore.user(currentUid),
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      passiveUserRef: passiveUserRef,
    );
    final userMuteRef = DocRefCore.userMute(passiveUid, currentUid);
    final requests = [
      FirestoreRequest(tokenRef, muteUserToken.toJson()),
      FirestoreRequest(userMuteRef, userMute.toJson()),
    ];
    return await _firestoreRepository.createDocs(requests);
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

    final postLike = PostLike(
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
      postRef: postRef,
      postId: postId,
    );
    final postLikeRef = DocRefCore.postLike(postRef, currentUid);
    final requestList = [
      FirestoreRequest(tokenRef, likePostToken.toJson()),
      FirestoreRequest(postLikeRef, postLike.toJson()),
    ];
    await _firestoreRepository.createDocs(requestList);
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
    await _firestoreRepository.deleteLikePostInfo(currentUid, post, tokenId);
  }

  void deletePost(Post deletePost) async {
    final result = await _firestoreRepository.deletePost(deletePost);
    await result.when(
      success: (_) async {
        _tokensNotifier.addDeletePostId(deletePost.postId);
        await _removePostImage(deletePost.typedImage());
        UIHelper.showErrorFlutterToast("投稿を削除しました。");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("投稿を削除することができませんでした。");
      },
    );
  }

  Future<void> _removePostImage(DetectedImage image) async {
    final request = DeleteObjectRequest(object: image.value);
    await _onCallRepository.deleteObject(request);
  }
}
