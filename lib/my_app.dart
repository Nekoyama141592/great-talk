import 'package:flutter/material.dart';
import 'package:great_talk/flavors.dart';
import 'package:great_talk/providers/global/app_router/app_router_notifier.dart';
import 'package:great_talk/providers/global/local_setting/local_setting.dart';
import 'package:great_talk/themes/themes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class MyAppPage extends ConsumerWidget {
  const MyAppPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(localSettingProvider);
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      title: F.title,
      theme:
          state.isDarkTheme ? darkThemeData(context) : lightThemeData(context),
    );
  }
}
