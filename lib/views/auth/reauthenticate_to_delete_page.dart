import 'package:flutter/material.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/views/screen/login_screen.dart';

class ReauthenticateToDeletePage extends StatelessWidget {
  const ReauthenticateToDeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CurrentUserController.to;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("ユーザーを削除"),
          ),
          body: LoginScreen(
              onAppleButtonPressed: controller.reauthenticateWithAppleToDelete,
              onGoogleButtonPressed:
                  controller.reauthenticateWithGoogleToDelete,
              title: "ユーザーの削除には再認証が必要です")),
    );
  }
}
