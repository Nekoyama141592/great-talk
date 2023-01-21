// flutter
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// common
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/colors.dart';

class ShowToast {
  static Future<void> showBasicFlutterToast(String msg,int second) async {
    await Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: second,
        backgroundColor: kMsgColor,
        textColor: Colors.white
    );
  }
  static BuildContext showIndicator(BuildContext context) {
    BuildContext innerContext = context;
    showDialog(
      context: context, 
      builder: (thisContext) {
        innerContext = thisContext;
        return const Center(child: CircularProgressIndicator(),);
      }
    );
    return innerContext;
  }
}