import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_user_token_entity/mute_user_token_entity.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';

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
    PostEntity post,
    String currentUid,
    MuteUserTokenEntity token,
  );
}
