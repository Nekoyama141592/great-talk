import 'package:flutter/material.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/components/basic_width_box.dart';

class MosaicUserChild extends StatelessWidget {
  const MosaicUserChild(
      {super.key,
      required this.publicUser,
      required this.msg,
      required this.title});
  final PublicUser publicUser;
  final String msg;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoldWhiteText(title),
        const BasicWidthBox(),
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
