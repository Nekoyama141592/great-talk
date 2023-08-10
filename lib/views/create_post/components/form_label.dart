import 'package:flutter/material.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/views/components/basic_height_box.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({Key? key, required this.title, required this.helpMsg})
      : super(key: key);
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
            onTap: () => UIHelper.simpleAlertDialog(helpMsg),
            child: const Icon(Icons.help),
          )
        ],
      ),
    );
  }
}
