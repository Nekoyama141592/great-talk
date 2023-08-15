import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  static MainController get to => Get.find<MainController>();
  late SharedPreferences prefs;
  final isAgreedToTerms = true.obs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    await clearBeforeV3();
    final result = prefs.getBool(PrefsKey.isAgreedToTerms.name) ?? false;
    isAgreedToTerms(result);
    super.onInit();
  }

  // バージョン3.0.0にアップデートする際に端末情報を初期化する.
  Future<void> clearBeforeV3() async {
    final isV3initialized =
        prefs.getBool(PrefsKey.isV3initialized.name) ?? false;
    if (!isV3initialized) {
      await prefs.clear();
    }
    await prefs.setBool(PrefsKey.isV3initialized.name, true);
  }

  void onAgreeButtonPressed() async {
    isAgreedToTerms(true);
    await prefs.setBool(PrefsKey.isAgreedToTerms.name, true);
  }
}
