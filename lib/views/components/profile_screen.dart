import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/user_profile_controller.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController(false));
    useEffect(() {
      controller.init();
      return;
    }, []);
    return Obx(() => controller.isLoading.value ||
            controller.passiveUser.value == null
        ? const CircularProgressIndicator()
        : Obx(() => Text(controller.passiveUser.value!.typedUserName().value)));
  }
}
