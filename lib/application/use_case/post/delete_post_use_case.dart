import 'package:great_talk/infrastructure/repository/api_repository.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
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
