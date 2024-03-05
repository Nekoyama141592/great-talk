import 'package:flutter/material.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/views/screen/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CurrentUserController.to;
    return SafeArea(
      child: Scaffold(
          body: LoginScreen(
              onAppleButtonPressed: controller.onAppleButtonPressed,
              onGoogleButtonPressed: controller.onGoogleButtonPressed,
              title: "ログイン")),
    );
  }
}
