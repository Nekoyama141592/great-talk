import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/presentation/state/common/image_user/image_user.dart';
import 'package:great_talk/application/use_case/file/file_use_case.dart';
import 'package:great_talk/domain/use_case_interface/user/i_user_use_case.dart';

class UserUseCase implements IUserUseCase {
  UserUseCase(this.fileUseCase);
  final FileUseCase fileUseCase;
  @override
  Future<List<ImageUser>> usersToImageUsers(List<PublicUser> users) async {
    final futures =
        users.map((user) async {
          final detectedImage = user.typedImage();
          final base64 = await fileUseCase.getObject(
            detectedImage.bucketName,
            detectedImage.value,
          );
          return ImageUser(user: user, base64: base64);
        }).toList();
    return Future.wait(futures);
  }
}
