import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/url_redirector.dart';
import 'package:great_talk/controllers/main_controller.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class TermsPage extends HookWidget {
  const TermsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = MainController.to;
    final style =
        TextStyle(color: Theme.of(context).focusColor, fontSize: 20.0);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: Get.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    wrongInfoMsg,
                    style: style,
                  ),
                  const Divider(),
                  TextButton(
                      onPressed: () async => await UrlRedirector.toTosPage(),
                      child: Text(
                        tosText,
                        style: style,
                      )),
                  const Divider(),
                  TextButton(
                      onPressed: () async =>
                          await UrlRedirector.toPrivacyPage(),
                      child: Text(
                        privacyPolicyText,
                        style: style,
                      )),
                  const Divider(),
                  RoundedButton(
                    press: controller.onAgreeButtonPressed,
                    text: agreeText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
