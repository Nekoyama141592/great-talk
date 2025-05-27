import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/providers/global/current_user/current_user_notifier.dart';
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
          onAppleButtonPressed: controller.onAppleButtonPressed,
          onGoogleButtonPressed: controller.onGoogleButtonPressed,
          title: "ログイン",
        ),
      ),
    );
  }
}
