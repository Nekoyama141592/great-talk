import 'dart:io';
import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/profile_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/utility/new_content.dart';

class MyProfileController extends ProfileController with CurrentUserMixin {
  MyProfileController() : super(true);
  static MyProfileController get to => Get.find<MyProfileController>();
  String bio = '';
  String userName = '';
  final Rx<File?> uploadFile = Rx(null);

  Future<void> onEditButtonPressed() async {}

  Future<void> createUserUpdateLog(String userImageUrl) async {
    final uid = currentUid();
    final newUserUpdateLog = NewContent.newUserUpdateLog(
        bio, userName, uid, userImageUrl, currentUserRef());
    final result =
        await repository.createUserUpdateLog(uid, newUserUpdateLog.toJson());
    result.when(success: (_) {
      UIHelper.showFlutterToast("情報が更新されました");
    }, failure: () {
      UIHelper.showErrorFlutterToast("情報が更新できませんでした");
    });
  }
}
