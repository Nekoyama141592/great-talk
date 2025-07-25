import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

/// Abstract interface for post deletion operations.
/// Handles deleting posts from the database and cleaning up associated images.
abstract class IDeletePostUseCase {
  /// Deletes a post from the database and cleans up associated images.
  ///
  /// [post] - The post to delete
  ///
  /// Returns a FutureResult indicating success or failure of the deletion.
  FutureResult<bool> deletePost(PostEntity post);
}
