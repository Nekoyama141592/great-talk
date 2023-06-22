// flutter
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;
import 'package:great_talk/common/ints.dart';

class UIHelper {
  static Future<void> showFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(
        msg: msg, timeInSecForIosWeb: timeInSecForIosWeb);
  }
}
