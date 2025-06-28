import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:great_talk/presentation/constant/toast_constant.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/constant/msg_constants.dart';
import 'package:great_talk/presentation/page/common/custom_snack_bar.dart';
import 'package:great_talk/presentation/page/common/subscribed_copyable_text.dart';

class ToastUiUtil {
  static void showPopup({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
  }) {
    showCupertinoModalPopup(context: context, builder: builder);
  }

  static Future<void> showFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: ToastConstant.timeInSecForIosWeb,
    );
  }

  static Future<void> showErrorFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: ToastConstant.timeInSecForIosWeb,
      backgroundColor: kErrorColor,
    );
  }

  static void _showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showSuccessSnackBar(BuildContext context, String msg) {
    _showSnackBar(context, CustomSnackBar.success(context, msg));
  }

  static void showFailureSnackBar(BuildContext context, String msg) {
    _showSnackBar(context, CustomSnackBar.failure(context, msg));
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
                onPressed: () => RouteUtil.back(innerContext),
                child: const Text(MsgConstants.cancelText),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: positiveAction,
                child: const Text(MsgConstants.okText),
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
                          positiveAction ?? () => Navigator.pop(innerContext),
                      child: const Text(MsgConstants.okText, style: style),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
