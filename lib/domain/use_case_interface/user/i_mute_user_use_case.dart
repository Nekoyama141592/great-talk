import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/repository/result/result.dart';

/// Abstract interface for user muting operations.
/// Handles muting users to prevent their content from appearing in feeds.
abstract class IMuteUserUseCase {
  /// Mutes a user by creating a mute record in the database.
  ///
  /// [post] - The post from which to extract the user to mute
  /// [currentUid] - The ID of the user performing the mute action
  /// [token] - The mute user token for authorization
  ///
  /// Returns a FutureResult indicating success or failure of the mute operation.
  FutureResult<bool> muteUser(
    Post post,
    String currentUid,
    MuteUserToken token,
  );
}
