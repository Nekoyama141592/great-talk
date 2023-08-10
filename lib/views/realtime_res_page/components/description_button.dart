import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';

class DescriptionButton extends HookWidget {
  const DescriptionButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = RealtimeResController.to;
    return InkWell(
      onTap: controller.onDescriptionButtonPressed,
      child: const Icon(Icons.description),
    );
  }
}
