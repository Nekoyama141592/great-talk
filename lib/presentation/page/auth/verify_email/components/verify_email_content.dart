import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';

class VerifyEmailContent extends StatelessWidget {
  const VerifyEmailContent({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BasicHeightBox(),
        Text(
          '$email\nに確認メールを送信しました。',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const BasicHeightBox(),
        const Text(
          'メール内のリンクをクリックして\nメールアドレスを確認してください。',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const BasicHeightBox(),
        const BasicHeightBox(),
      ],
    );
  }
}