import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/providers/logic/router/router_logic.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/views/common/custom_snack_bar.dart';
import 'package:great_talk/views/common/subscribed_copyable_text.dart';

class UIHelper {
  static void showPopup({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
  }) {
    showCupertinoModalPopup(context: context, builder: builder);
  }

  static Future<void> showFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: timeInSecForIosWeb,
    );
  }

  static Future<void> showErrorFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: kErrorColor,
    );
  }

  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar.blue(context, msg)
    );
  }

  static void cupertinoAlertDialog(
    BuildContext context,
    String msg,
    void Function()? positiveAction,
  ) {
    showDialog(
      context: context,
      builder:
          (innerContext) => CupertinoAlertDialog(
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                onPressed: () => RouterLogic.back(innerContext),
                child: const Text(cancelText),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: positiveAction,
                child: const Text(okText),
              ),
            ],
          ),
    );
  }

  static void simpleAlertDialog(
    BuildContext context,
    String msg, {
    bool? needsSubscribing,
    void Function()? positiveAction,
  }) {
    const style = TextStyle(fontSize: 20);
    showDialog(
      context: context,
      builder:
          (innerContext) => AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(innerContext).size.height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (needsSubscribing ?? false)
                        ? SubscribedCopyableText(data: msg, style: style)
                        : SelectableText(msg, style: style),
                    const Divider(),
                    TextButton(
                      onPressed:
                          positiveAction ??
                          () => RouterLogic.back(innerContext),
                      child: const Text(okText, style: style),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
