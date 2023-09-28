import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';

class UIHelper {
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

  static void simpleAlertDialog(String msg) {
    const style = TextStyle(fontSize: 20, color: Colors.black);
    Get.dialog(AlertDialog(
      content: SizedBox(
        height: Get.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                msg,
                style: style,
              ),
              const Divider(),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
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
