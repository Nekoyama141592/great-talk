import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/url_redirector.dart';
import 'package:great_talk/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  static MainController get to => Get.find<MainController>();
  late SharedPreferences prefs;
  @override
  void onReady() async {
    prefs = await SharedPreferences.getInstance();
    await clearBeforeV3();
    final bool isAgreedToTerms =
        prefs.getBool(PrefsKey.isAgreedToTerms.name) ?? false;
    const style = TextStyle(fontSize: 20, color: Colors.black);
    if (isAgreedToTerms == false) {
      Get.dialog(AlertDialog(
        content: SizedBox(
          height: Get.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  wrongInfoMsg,
                  style: style,
                ),
                const Divider(),
                TextButton(
                    onPressed: () async => await UrlRedirector.toTosPage(),
                    child: const Text(
                      tosText,
                      style: style,
                    )),
                const Divider(),
                TextButton(
                    onPressed: () {
                      _setIsSeenNoticeDialog();
                      Get.back();
                    },
                    child: const Text(
                      agreeText,
                      style: style,
                    )),
              ],
            ),
          ),
        ),
      ));
    }
    super.onReady();
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

  Future<void> _setIsSeenNoticeDialog() async =>
      await prefs.setBool(PrefsKey.isAgreedToTerms.name, true);
}
