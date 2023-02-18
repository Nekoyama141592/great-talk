// flutter
import 'package:flutter/material.dart';
// packages
import 'package:get/get.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/themes/themes.dart';
// components
import 'package:great_talk/views/persons_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.title,
      theme: lightThemeData(context),
      home: const PersonsPage()
    );
  }
}

