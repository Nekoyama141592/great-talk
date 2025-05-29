import 'package:flutter/material.dart';
import 'package:great_talk/views/components/app_bar_action.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.onMenuPressed});

  final void Function() onMenuPressed;
  @override
  Widget build(BuildContext context) {
    return AppBarAction(
      onTap: onMenuPressed,
      child: const Icon(Icons.menu),
    );
  }
}
