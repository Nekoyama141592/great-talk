import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/presentation/state/common/image_user/image_user.dart';
import 'package:great_talk/domain/use_case_interface/user/i_user_use_case.dart';

class UserUseCase implements IUserUseCase {
  @override
  Future<List<ImageUser>> usersToImageUsers(
    List<PublicUserEntity> users,
  ) async {
    return users.map((user) => ImageUser(user: user)).toList();
  }
}
