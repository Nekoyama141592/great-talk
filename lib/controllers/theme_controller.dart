import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();
  final isDarkTheme = true.obs;
  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(PrefsKey.isDarkTheme.name) ?? true;
    isDarkTheme(result);
    super.onInit();
  }

  void onSwichChanged(bool value) async {
    isDarkTheme(value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PrefsKey.isDarkTheme.name, value);
  }
}
