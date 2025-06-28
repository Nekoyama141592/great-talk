import 'package:flutter/material.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/presentation/component/basic_width_box.dart';

class MosaicUserChild extends StatelessWidget {
  const MosaicUserChild({
    super.key,
    required this.publicUser,
    required this.msg,
    required this.title,
  });
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
          onTap: () => ToastUiUtil.simpleAlertDialog(context, msg),
          child: const Icon(Icons.info, color: Colors.white),
        ),
      ],
    );
  }
}
