import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';

/// Abstract interface for post muting operations.
/// Handles muting posts to prevent them from appearing in user feeds.
abstract class IMutePostUseCase {
  /// Mutes a post by creating a mute record in the database.
  ///
  /// [post] - The post to mute
  /// [currentUid] - The ID of the user muting the post
  /// [token] - The mute post token for authorization
  ///
  /// Returns a FutureResult indicating success or failure of the mute operation.
  FutureResult<bool> mutePost(
    Post post,
    String currentUid,
    MutePostToken token,
  );
}
