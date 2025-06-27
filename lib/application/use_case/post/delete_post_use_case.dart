import 'package:great_talk/repository/api_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/repository/database_repository.dart';

class DeletePostUseCase {
  DeletePostUseCase({required this.firestoreRepository, required this.apiRepository});
  final DatabaseRepository firestoreRepository;
  final ApiRepository apiRepository;

  FutureResult<bool> deletePost(Post post) async {
    final result = await firestoreRepository.deletePost(post);
    result.when(
      success: (_) {
        final image = post.typedImage();
        apiRepository.deleteObject(image);
      },
      failure: (_) {},
    );
    return result;
  }
}