import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/url_redirector.dart';
import 'package:great_talk/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  late SharedPreferences prefs;
  @override
  void onReady() async {
    prefs = await SharedPreferences.getInstance();
    await clearBeforeV3();
    final bool isAgreedToTerms =
        prefs.getBool(isAgreedToTermsPrefsKey) ?? false;
    const style = TextStyle(fontSize: 20, color: Colors.black);
    if (isAgreedToTerms == false) {
      Get.dialog(AlertDialog(
        content: SizedBox(
          height: Get.height * 0.75,
          child: SingleChildScrollView(
            child: Column(
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
    final isV3initialized = prefs.getBool(isV3initializedPrefsKey) ?? false;
    if (!isV3initialized) {
      await prefs.clear();
    }
    await prefs.setBool(isV3initializedPrefsKey, true);
  }
  Future<void> _setIsSeenNoticeDialog() async =>
      await prefs.setBool(isAgreedToTermsPrefsKey, true);
}
