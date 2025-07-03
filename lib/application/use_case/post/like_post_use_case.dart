import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/like_post_token_entity/like_post_token_entity.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/use_case_interface/post/i_like_post_use_case.dart';

class LikePostUseCase implements ILikePostUseCase {
  LikePostUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  @override
  FutureResult<bool> likePost(
    String currentUid,
    LikePostTokenEntity token,
    PostEntity post,
  ) {
    return firestoreRepository.createLikePostInfo(
      currentUid,
      post.uid,
      post.postId,
    );
  }

  @override
  FutureResult<bool> unLikePost(
    String currentUid,
    String tokenId,
    PostEntity post,
  ) {
    return firestoreRepository.deleteLikePostInfo(
      currentUid,
      post.uid,
      post.postId,
      tokenId,
    );
  }
}
