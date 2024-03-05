// flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/theme_controller.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/themes/themes.dart';
import 'package:great_talk/utility/router.dart';
import 'package:great_talk/views/first_page/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const path = "/";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: getPages,
        initialRoute: path,
        title: F.title,
        theme: controller.isDarkTheme.value
            ? darkThemeData(context)
            : lightThemeData(context),
        home: const FirstPage()));
  }
}
