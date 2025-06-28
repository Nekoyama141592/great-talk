import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/core/provider/keep_alive/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
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
                ToastUiUtil.showSuccessSnackBar(context, 'Appleログインに成功しました');
                RouteUtil.back(context);
              },
              failure:
                  (_) => ToastUiUtil.showFailureSnackBar(
                    context,
                    "Appleログインに失敗しました",
                  ),
            );
          },
          onGoogleButtonPressed: () async {
            final result = await controller.onGoogleButtonPressed();
            result.when(
              success: (_) {
                ToastUiUtil.showSuccessSnackBar(context, 'Googleログインに成功しました');
                RouteUtil.back(context);
              },
              failure:
                  (_) => ToastUiUtil.showFailureSnackBar(
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
