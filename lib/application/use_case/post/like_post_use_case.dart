import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/infrastructure/model/database_schema/post_like/post_like.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';

class LikePostUseCase {
  LikePostUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  FutureResult<bool> likePost(
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

  FutureResult<bool> unLikePost(String currentUid, String tokenId, Post post) {
    return firestoreRepository.deleteLikePostInfo(currentUid, post, tokenId);
  }
}
