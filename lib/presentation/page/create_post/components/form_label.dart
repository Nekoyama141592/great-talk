import 'package:flutter/material.dart';
import 'package:great_talk/presentation/common/toast_ui_core.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({super.key, required this.title, required this.helpMsg});
  final String title;
  final String helpMsg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(title),
          const BasicHeightBox(),
          InkWell(
            onTap: () => ToastUiCore.simpleAlertDialog(context, helpMsg),
            child: const Icon(Icons.help),
          ),
        ],
      ),
    );
  }
}
