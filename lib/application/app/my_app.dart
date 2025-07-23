import 'package:flutter/material.dart';
import 'package:great_talk/application/app/flavors.dart';
import 'package:great_talk/core/provider/keep_alive/app_router/app_router_provider.dart';
import 'package:great_talk/presentation/util/theme_ui_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      title: F.title,
      theme: ThemeUiUtil.dark(context),
    );
  }
}
