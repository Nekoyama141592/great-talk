import 'package:flutter/material.dart';

class EmailAuthHeader extends StatelessWidget implements PreferredSizeWidget {
  const EmailAuthHeader({super.key, required this.isSignUp});

  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(isSignUp ? 'アカウント作成' : 'ログイン'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
