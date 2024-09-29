// flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/local_controller.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/themes/themes.dart';
import 'package:great_talk/utility/router.dart';
import 'package:great_talk/views/check_page/check_page.dart';
import 'package:great_talk/views/main/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const path = "/";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocalController());
    return Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: getPages,
        initialRoute: path,
        title: F.title,
        theme: controller.rxIsDarkTheme.value
            ? darkThemeData(context)
            : lightThemeData(context),
        home: const CheckPage(
          child: MyHomePage(),
        )));
  }
}
