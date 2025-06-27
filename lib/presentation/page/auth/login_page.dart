import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/route_core.dart';
import 'package:great_talk/provider/keep_alive/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/presentation/common/toast_ui_core.dart';
import 'package:great_talk/presentation/page/screen/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  static const path = "/login";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(currentUserNotifierProvider.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: LoginScreen(
          onAppleButtonPressed: () async {
            final result = await controller.onAppleButtonPressed();
            result.when(
              success: (_) {
                ToastUiCore.showSuccessSnackBar(context, 'Appleログインに成功しました');
                RouteCore.back(context);
              },
              failure:
                  (_) => ToastUiCore.showFailureSnackBar(
                    context,
                    "Appleログインに失敗しました",
                  ),
            );
          },
          onGoogleButtonPressed: () async {
            final result = await controller.onGoogleButtonPressed();
            result.when(
              success: (_) {
                ToastUiCore.showSuccessSnackBar(context, 'Googleログインに成功しました');
                RouteCore.back(context);
              },
              failure:
                  (_) => ToastUiCore.showFailureSnackBar(
                    context,
                    "Googleログインに失敗しました",
                  ),
            );
          },
          title: "ログイン",
        ),
      ),
    );
  }
}
