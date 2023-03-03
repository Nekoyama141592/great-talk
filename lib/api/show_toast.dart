// flutter
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
class ShowToast {
  static Future<void> showFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(msg: msg);
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