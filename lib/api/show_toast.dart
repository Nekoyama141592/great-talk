// flutter
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {

  static Future<void> showToast(String msg) async {
    await Fluttertoast.showToast(msg: msg);
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