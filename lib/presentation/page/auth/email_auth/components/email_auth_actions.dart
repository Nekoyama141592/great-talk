import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

class EmailAuthActions extends StatelessWidget {
  const EmailAuthActions({
    super.key,
    required this.isSignUp,
    required this.isLoading,
    required this.onAuth,
    required this.onToggleSignUpMode,
  });

  final bool isSignUp;
  final bool isLoading;
  final VoidCallback onAuth;
  final VoidCallback onToggleSignUpMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
          text: isSignUp ? 'アカウントを作成' : 'ログイン',
          textColor: Colors.white,
          buttonColor: Theme.of(context).primaryColor,
          press: onAuth,
          enabled: !isLoading,
        ),
        const BasicHeightBox(),
        TextButton(
          onPressed: onToggleSignUpMode,
          child: Text(
            isSignUp ? 'すでにアカウントをお持ちですか？ログイン' : 'アカウントをお持ちでない方はアカウント作成',
          ),
        ),
      ],
    );
  }
}
