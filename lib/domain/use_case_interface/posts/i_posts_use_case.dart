import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';

/// Abstract interface for posts processing operations.
/// Handles creating user posts with associated user data and images, with sorting support.
abstract class IPostsUseCase {
  /// Creates user posts from a list of posts with associated user data and images.
  ///
  /// [posts] - The list of posts to process
  /// [isRankingPosts] - Whether to sort by like count (true) or created date (false)
  ///
  /// Returns a list of UserPost objects containing post, user, and image data.
  /// Posts are sorted either by like count (ranking) or creation date (timeline).
  Future<List<UserPost>> createUserPosts(
    List<Post> posts, {
    bool isRankingPosts = false,
  });
}
