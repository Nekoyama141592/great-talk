import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/api/url_api.dart';
import 'package:great_talk/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  late SharedPreferences prefs;
  @override
  void onReady() async {
    prefs = await SharedPreferences.getInstance();
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
                    onPressed: () async => await UrlApi.toTosPage(),
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

  Future<void> _setIsSeenNoticeDialog() async =>
      await prefs.setBool(isAgreedToTermsPrefsKey, true);
}
