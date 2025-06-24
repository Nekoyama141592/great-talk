import 'package:great_talk/repository/api_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/post_like/post_like.dart';
import 'package:great_talk/model/database_schema/post_mute/post_mute.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/repository/database_repository.dart';

class PostUseCase {
  PostUseCase({required this.firestoreRepository, required this.apiRepository});
  final DatabaseRepository firestoreRepository;
  final ApiRepository apiRepository;

  FutureResult<bool> mutePost(
    Post post,
    String currentUid,
    MutePostToken token,
  ) {
    final postMute = PostMute.fromPost(post, currentUid);
    return firestoreRepository.createMutePostInfo(
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
  ) {
    final passiveUid = post.uid;
    final userMute = UserMute.fromPost(currentUid, post);
    return firestoreRepository.createMuteUserInfo(
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
  ) {
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

  FutureResult<bool> deletePost(Post post) async {
    final result = await firestoreRepository.deletePost(post);
    result.when(
      success: (_) {
        final image = post.typedImage();
        apiRepository.deleteObject(image);
      },
      failure: (_) {},
    );
    return result;
  }
}
