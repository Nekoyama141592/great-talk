import 'package:flutter/material.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/views/components/basic_height_box.dart';

class MosaicPostChild extends StatelessWidget {
  const MosaicPostChild(
      {Key? key, required this.content, required this.msg, required this.title})
      : super(key: key);
  final ChatContent content;
  final String msg;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoldWhiteText(title),
        const BasicHeightBox(),
        InkWell(
          onTap: () => UIHelper.simpleAlertDialog(msg),
          child: const Icon(
            Icons.info,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
