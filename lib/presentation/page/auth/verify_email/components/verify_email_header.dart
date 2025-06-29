import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';

class VerifyEmailHeader extends StatelessWidget {
  const VerifyEmailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.email_outlined,
          size: 80,
          color: Colors.blue,
        ),
        const BasicHeightBox(),
        const Text(
          'メールアドレスの確認',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}