import 'package:flutter/material.dart';

import 'package:great_talk/providers/global/current_user/current_user_notifier.dart';
import 'package:great_talk/views/screen/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReauthenticateToDeletePage extends ConsumerWidget {
  const ReauthenticateToDeletePage({super.key});
  static const path = "/reauthenticate/delete";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(currentUserNotifierProvider.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("ユーザーを削除")),
        body: LoginScreen(
          onAppleButtonPressed: controller.reauthenticateWithAppleToDelete,
          onGoogleButtonPressed: controller.reauthenticateWithGoogleToDelete,
          title: "ユーザーの削除には再認証が必要です",
        ),
      ),
    );
  }
}
