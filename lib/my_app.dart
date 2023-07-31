// flutter
import 'package:flutter/material.dart';
// packages
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/themes/themes.dart';
import 'package:great_talk/utility/router.dart';
import 'package:great_talk/views/loading_page.dart';
// components
import 'package:great_talk/views/main/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentUserController = Get.put(CurrentUserController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: getPages,
        initialRoute: '/',
        title: F.title,
        theme: lightThemeData(context),
        home: Obx(() => currentUserController.currentUser.value != null
            ? const MyHomePage()
            : const LoadingPage()));
  }
}
