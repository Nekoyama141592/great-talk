import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/remote_config_controller.dart';
import 'package:great_talk/views/first_page/maintenance_page.dart';
import 'package:great_talk/views/first_page/required_update_page.dart';
import 'package:great_talk/views/loading_page.dart';
import 'package:great_talk/views/main/my_home_page.dart';

class FirstPage extends HookWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentUserController = Get.put(CurrentUserController());
    final remoteConfigController = Get.put(RemoteConfigController());
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await remoteConfigController.once();
      });
      return;
    }, []);
    return Obx(() {
      if (remoteConfigController.maintenanceMode.value) {
        return const MaintenancePage();
      }
      if (remoteConfigController.needsUpdate()) {
        return const RequiredUpdatePage();
      }
      if (currentUserController.currentUser.value == null) {
        return const LoadingPage();
      } else {
        return const MyHomePage();
      }
    });
  }
}
