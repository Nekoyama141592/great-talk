import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/repository/real/on_call/on_call_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
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

@riverpod
PostLogic postLogic(Ref ref) => PostLogic(ref);

class PostLogic {
  // TODO: 良くないので修正
  PostLogic(this.ref);
  final Ref ref;

  FirestoreRepository get _firestoreRepository =>
      ref.read(firestoreRepositoryProvider);
  OnCallRepository get _onCallRepository => ref.read(onCallRepositoryProvider);
  TokensNotifier get _tokensNotifier =>
      ref.read(tokensNotifierProvider.notifier);

  FutureResult<bool> mutePost(Post post, String currentUid,MutePostToken token) async {
    final postMute = PostMute.fromPost(post, currentUid);
    return await _firestoreRepository.createMutePostInfo(currentUid, post, token, postMute);
  }

  FutureResult<bool> muteUser(Post post, String currentUid,MuteUserToken token) async {
    final passiveUid = post.uid;
    final userMute = UserMute.fromPost(currentUid, post);
    return await _firestoreRepository.createMuteUserInfo(currentUid, passiveUid, token, userMute);
  }


  FutureResult<bool> onLikeButtonPressed(String currentUid,LikePostToken token,Post post) async {
    final postLike = PostLike.fromPost(post, currentUid);
    return _firestoreRepository.createLikePostInfo(currentUid, post, token, postLike);
  }

  FutureResult<bool> onUnLikeButtonPressed(String currentUid,String tokenId,Post post) {
    return _firestoreRepository.deleteLikePostInfo(currentUid, post, tokenId);
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
