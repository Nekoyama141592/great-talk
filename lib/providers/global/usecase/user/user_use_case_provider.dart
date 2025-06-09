import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/view_model_state/common/image_user/image_user.dart';
import 'package:great_talk/providers/global/usecase/file/file_use_case_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_use_case_provider.g.dart';
@riverpod
UserUseCase userUseCase(Ref ref) => UserUseCase(ref.watch(fileUseCaseProvider));
class UserUseCase {
  UserUseCase(this.fileUseCase);
  final FileUseCase fileUseCase;
  Future<List<ImageUser>> usersToImageUsers(List<PublicUser> users) async {
    final futures = users.map((user) async {
      final detectedImage = user.typedImage();
      final base64 = await fileUseCase.getS3Image(detectedImage.bucketName,detectedImage.value);
      return ImageUser(user: user, base64: base64);
    }).toList();
    return Future.wait(futures);
  }
}