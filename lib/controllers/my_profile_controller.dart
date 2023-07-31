import 'package:get/get.dart';
import 'package:great_talk/controllers/profile_controller.dart';

class MyProfileController extends ProfileController {
  MyProfileController() : super(true);
  static MyProfileController get to => Get.find<MyProfileController>();

  Future<void> onEditButtonPressed() async {}
}
