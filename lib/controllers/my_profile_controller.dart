import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/profile_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/utility/file_utility.dart';

class MyProfileController extends ProfileController with CurrentUserMixin {
  MyProfileController() : super(true);
  static MyProfileController get to => Get.find<MyProfileController>();
  @override
  String passiveUid() => currentUid();
  @override
  void setQuery() {
    // MyProfileのpassiveUserの情報はCurrentUserControllerで代入されている
    query = FirestoreQueries.userPostsQueryByNewest(currentUid());
  }

  @override
  Future<void> onReload() async {
    setQuery();
    return await super.onReload();
  }

  // CurrentUserControllerから起動させる.
  Future<void> updateProfileUserState(PublicUser result) async {
    passiveUser(result);
    final s3Image = await FileUtility.getS3Image(
        result.typedImage().bucketName, result.typedImage().value);
    uint8list(s3Image);
  }
}
