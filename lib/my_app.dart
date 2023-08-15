// flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/themes/themes.dart';
import 'package:great_talk/utility/router.dart';
import 'package:great_talk/views/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: getPages,
        initialRoute: '/',
        title: F.title,
        theme: lightThemeData(context),
        home: const FirstPage());
  }
}
