// flutter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/providers/global/local_setting/local_setting.dart';
import 'package:great_talk/themes/themes.dart';
import 'package:great_talk/utility/router.dart';
import 'package:great_talk/views/check_page/check_page.dart';
import 'package:great_talk/views/main/my_home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MyAppPage extends ConsumerWidget {
  const MyAppPage({super.key});
  static const path = "/";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(localSettingProvider);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialRoute: path,
      title: F.title,
      theme:
          state.isDarkTheme ? darkThemeData(context) : lightThemeData(context),
      home: const CheckPage(child: MyHomePage()),
    );
  }
}
