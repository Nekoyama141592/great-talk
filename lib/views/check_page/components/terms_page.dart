import 'package:flutter/material.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/core/url_redirector.dart';
import 'package:great_talk/providers/global/terms/terms_notifier.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TermsPage extends ConsumerWidget {
  const TermsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = TextStyle(
      color: Theme.of(context).focusColor,
      fontSize: 20.0,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(wrongInfoMsg, style: style),
                  const Divider(),
                  TextButton(
                    onPressed: () async => await UrlRedirector.toTosPage(),
                    child: Text(tosText, style: style),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () async => await UrlRedirector.toPrivacyPage(),
                    child: Text(privacyPolicyText, style: style),
                  ),
                  const Divider(),
                  RoundedButton(
                    press:
                        ref
                            .read(termsNotifierProvider.notifier)
                            .onAgreeButtonPressed,
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
