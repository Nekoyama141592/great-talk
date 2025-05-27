import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class RouterCore {
  static void pushPath(String path) {
    Get.toNamed(path);
  }
  static void back() {
    Get.back();
  }
}
