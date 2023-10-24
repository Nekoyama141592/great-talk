import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

class SubscribedCopyableText extends StatelessWidget {
  const SubscribedCopyableText({Key? key, required this.data, this.style})
      : super(key: key);
  final String data;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Obx(() => PurchasesController.to.isSubscribing()
        ? SelectableText(data)
        : InkWell(
            onTap: () => UIHelper.showFlutterToast("コピーするにはベーシックプランへの登録が必要です。"),
            child: Text(
              data,
              style: style,
            )));
  }
}
