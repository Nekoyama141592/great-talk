import 'package:flutter/material.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
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
            onTap: () => ToastUiUtil.simpleAlertDialog(context, helpMsg),
            child: const Icon(Icons.help),
          ),
        ],
      ),
    );
  }
}
