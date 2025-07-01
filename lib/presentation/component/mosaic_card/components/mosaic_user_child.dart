import 'package:flutter/material.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/presentation/component/basic_width_box.dart';

class MosaicUserChild extends StatelessWidget {
  const MosaicUserChild({
    super.key,
    required this.publicUserEntity,
    required this.msg,
    required this.title,
  });
  final PublicUserEntity publicUserEntity;
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
