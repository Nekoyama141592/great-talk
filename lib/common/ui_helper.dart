import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/ints.dart';

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
}
