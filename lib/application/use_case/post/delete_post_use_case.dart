import 'package:great_talk/infrastructure/repository/api_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/use_case_interface/post/i_delete_post_use_case.dart';

class DeletePostUseCase implements IDeletePostUseCase {
  DeletePostUseCase({
    required this.firestoreRepository,
    required this.apiRepository,
  });
  final DatabaseRepository firestoreRepository;
  final ApiRepository apiRepository;

  @override
  FutureResult<bool> deletePost(PostEntity post) async {
    final result = await firestoreRepository.deletePost(post.uid, post.postId);
    result.when(
      success: (_) {
        final imageValue = post.image.moderationModelVersion;
        if (imageValue.isNotEmpty) {
          apiRepository.deleteObject(imageValue);
        }
      },
      failure: (_) {},
    );
    return result;
  }
}
