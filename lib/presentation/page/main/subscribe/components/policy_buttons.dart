import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_talk/core/url_redirector.dart';
import 'package:great_talk/presentation/page/main/subscribe/components/policy_button.dart';

class PolicyButtons extends StatelessWidget {
  const PolicyButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const PolicyButton(
            label: 'プライバシーポリシー',
            onPressed: UrlRedirector.toPrivacyPage,
          ),
          const PolicyButton(label: '利用規約', onPressed: UrlRedirector.toTosPage),
          if (Platform.isIOS)
            const PolicyButton(
              label: 'EULA',
              onPressed: UrlRedirector.toEULAPage,
            ),
        ],
      ),
    );
  }
}
