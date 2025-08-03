import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';

class EmailAuthForm extends StatelessWidget {
  const EmailAuthForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.emailValidator,
    required this.passwordValidator,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? Function(String?) emailValidator;
  final String? Function(String?) passwordValidator;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'メールアドレス',
              hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
              border: OutlineInputBorder(),
            ),
            validator: emailValidator,
          ),
          const BasicHeightBox(),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'パスワード',
              hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
              border: OutlineInputBorder(),
            ),
            validator: passwordValidator,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
