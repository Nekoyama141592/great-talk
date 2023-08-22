import 'package:flutter/material.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';

class ClearLogButton extends StatelessWidget {
  const ClearLogButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = RealtimeResController.to;
    return InkWell(
      onTap: controller.showCleanLocalMsgDialog,
      child: const Icon(Icons.cleaning_services),
    );
  }
}
