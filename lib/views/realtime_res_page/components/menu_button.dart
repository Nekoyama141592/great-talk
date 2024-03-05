import 'package:flutter/material.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
import 'package:great_talk/views/components/app_bar_action.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = RealtimeResController.to;
    return AppBarAction(
      onTap: () => controller.onMenuPressed(context),
      child: const Icon(Icons.menu),
    );
  }
}
