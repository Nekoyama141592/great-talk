import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/repository/result/result.dart';

/// Abstract interface for post like/unlike operations.
/// Handles liking and unliking posts in the database.
abstract class ILikePostUseCase {
  /// Likes a post by creating a like record in the database.
  ///
  /// [currentUid] - The ID of the user liking the post
  /// [token] - The like post token for authorization
  /// [post] - The post to like
  ///
  /// Returns a FutureResult indicating success or failure of the like operation.
  FutureResult<bool> likePost(
    String currentUid,
    LikePostToken token,
    Post post,
  );

  /// Unlikes a post by removing the like record from the database.
  ///
  /// [currentUid] - The ID of the user unliking the post
  /// [tokenId] - The ID of the token used for authorization
  /// [post] - The post to unlike
  ///
  /// Returns a FutureResult indicating success or failure of the unlike operation.
  FutureResult<bool> unLikePost(String currentUid, String tokenId, Post post);
}
