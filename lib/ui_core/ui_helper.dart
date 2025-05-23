import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:get/get.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/views/common/subscribed_copyable_text.dart';

class UIHelper {
  static void showPopup(
      {required BuildContext context,
      required Widget Function(BuildContext) builder}) {
    showCupertinoModalPopup(context: context, builder: builder);
  }

  static Future<void> showFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(
        msg: msg, timeInSecForIosWeb: timeInSecForIosWeb);
  }

  static Future<void> showErrorFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(
        msg: msg,
        timeInSecForIosWeb: timeInSecForIosWeb,
        backgroundColor: kErrorColor);
  }

  static void cupertinoAlertDialog(
      String msg, void Function()? positiveAction) {
    Get.dialog(CupertinoAlertDialog(
      content: Text(msg),
      actions: [
        CupertinoDialogAction(
            onPressed: Get.back, child: const Text(cancelText)),
        CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: positiveAction,
            child: const Text(okText))
      ],
    ));
  }

  static void simpleAlertDialog(String msg,
      {bool? needsSubscribing, void Function()? positiveAction}) {
    const style = TextStyle(fontSize: 20);
    Get.dialog(AlertDialog(
      content: SizedBox(
        height: Get.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (needsSubscribing ?? false)
                  ? SubscribedCopyableText(
                      data: msg,
                      style: style,
                    )
                  : SelectableText(
                      msg,
                      style: style,
                    ),
              const Divider(),
              TextButton(
                  onPressed: positiveAction ?? Get.back,
                  child: const Text(
                    okText,
                    style: style,
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
