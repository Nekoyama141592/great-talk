import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/controllers/remote_config_controller.dart';

class RequiredUpdatePage extends StatelessWidget {
  const RequiredUpdatePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = RemoteConfigController.to;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
            alignment: Alignment.center,
            child: Obx(() => BasicBoldText(controller.forcedUpdateMsg.value))),
      ),
    );
  }
}
