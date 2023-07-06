import 'package:flutter/material.dart';
import 'package:great_talk/common/url_redirector.dart';

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: () async => await UrlRedirector.toPrivacyPage(),
              child: Text(
                'プライバシーポリシー',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).focusColor),
              )),
        ));
  }
}
