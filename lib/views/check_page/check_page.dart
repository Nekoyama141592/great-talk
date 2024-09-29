import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/main_controller.dart';
import 'package:great_talk/controllers/remote_config_controller.dart';
import 'package:great_talk/views/check_page/components/maintenance_page.dart';
import 'package:great_talk/views/check_page/components/required_update_page.dart';
import 'package:great_talk/views/check_page/components/terms_page.dart';
import 'package:great_talk/views/loading_page.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final currentUserController = Get.put(CurrentUserController());
    final remoteConfigController = Get.put(RemoteConfigController());
    final mainController = Get.put(MainController());
    return Obx(() {
      if (remoteConfigController.maintenanceMode.value) {
        return const MaintenancePage();
      }
      if (remoteConfigController.needsUpdate) {
        return const RequiredUpdatePage();
      }
      if (!mainController.isAgreedToTerms.value) {
        return const TermsPage();
      }
      if (currentUserController.rxAuthUser.value == null) {
        return const LoadingPage();
      } else {
        return child;
      }
    });
  }
}
