import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/post_like/post_like.dart';
import 'package:great_talk/model/database_schema/post_mute/post_mute.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_usecase.g.dart';

@riverpod
PostUsecase postUsecase(Ref ref) =>
    PostUsecase(firestoreRepository: ref.watch(firestoreRepositoryProvider));

class PostUsecase {
  PostUsecase({required this.firestoreRepository});
  final FirestoreRepository firestoreRepository;

  FutureResult<bool> mutePost(
    Post post,
    String currentUid,
    MutePostToken token,
  ) async {
    final postMute = PostMute.fromPost(post, currentUid);
    return await firestoreRepository.createMutePostInfo(
      currentUid,
      post,
      token,
      postMute,
    );
  }

  FutureResult<bool> muteUser(
    Post post,
    String currentUid,
    MuteUserToken token,
  ) async {
    final passiveUid = post.uid;
    final userMute = UserMute.fromPost(currentUid, post);
    return await firestoreRepository.createMuteUserInfo(
      currentUid,
      passiveUid,
      token,
      userMute,
    );
  }

  FutureResult<bool> onLikeButtonPressed(
    String currentUid,
    LikePostToken token,
    Post post,
  ) async {
    final postLike = PostLike.fromPost(post, currentUid);
    return firestoreRepository.createLikePostInfo(
      currentUid,
      post,
      token,
      postLike,
    );
  }

  FutureResult<bool> onUnLikeButtonPressed(
    String currentUid,
    String tokenId,
    Post post,
  ) {
    return firestoreRepository.deleteLikePostInfo(currentUid, post, tokenId);
  }

  FutureResult<bool> deletePost(Post post) {
    return firestoreRepository.deletePost(post);
  }

  Future<void> _removePostImage(DetectedImage image) async {
    // final request = DeleteObjectRequest(object: image.value);
    // await onCallRepository.deleteObject(request);
  }
}
