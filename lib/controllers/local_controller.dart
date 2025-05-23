import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalController extends GetxController {
  static LocalController get to => Get.find<LocalController>();
  final rxIsDarkTheme = true.obs;
  final rxNeedFirstMessage = true.obs;
  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkTheme = prefs.getBool(PrefsKey.isDarkTheme.name) ?? true;
    rxIsDarkTheme(isDarkTheme);
    final needFirstMessage =
        prefs.getBool(PrefsKey.needFirstMessage.name) ?? true;
    rxNeedFirstMessage(needFirstMessage);
    super.onInit();
  }

  void onThemeSwichChanged(bool value) async {
    rxIsDarkTheme(value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PrefsKey.isDarkTheme.name, value);
  }

  void onNeedFirstMessageSwichChanged(bool value) async {
    rxNeedFirstMessage(value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PrefsKey.needFirstMessage.name, value);
  }
}
