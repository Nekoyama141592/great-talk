import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/providers/global/current_user/current_user_notifier.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/views/screen/login_screen.dart';
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
            result.when(success: (user) {
              UIHelper.showFlutterToast('ログインに成功しました');
              controller.onLoginSuccess(user);
            }, failure: (_) {
               UIHelper.showErrorFlutterToast("ログインに失敗しました");
            });
          },
          onGoogleButtonPressed: () async {
            final result = await controller.onGoogleButtonPressed();
            result.when(success: (user) {
              UIHelper.showFlutterToast('ログインに成功しました');
              controller.onLoginSuccess(user);
            }, failure: (_) {
               UIHelper.showErrorFlutterToast("ログインに失敗しました");
            });
          },
          title: "ログイン",
        ),
      ),
    );
  }
}
