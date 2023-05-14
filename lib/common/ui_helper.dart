// flutter
import 'package:fluttertoast/fluttertoast.dart' as fluttertoast;

class UIHelper {
  static Future<void> showFlutterToast(String msg) async {
    await fluttertoast.Fluttertoast.showToast(msg: msg);
  }
}
