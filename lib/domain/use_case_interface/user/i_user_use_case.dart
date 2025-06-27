import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/presentation/state/common/image_user/image_user.dart';

/// Abstract interface for user data transformation operations.
/// Handles converting user data to UI-ready format with associated images.
abstract class IUserUseCase {
  /// Converts a list of PublicUser objects to ImageUser objects with associated images.
  ///
  /// [users] - The list of users to transform
  ///
  /// Returns a list of ImageUser objects containing user data and base64 image data.
  Future<List<ImageUser>> usersToImageUsers(List<PublicUser> users);
}
