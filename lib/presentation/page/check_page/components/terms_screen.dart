import 'package:flutter/material.dart';
import 'package:great_talk/presentation/constant/msg_constants.dart';
import 'package:great_talk/core/util/url_redirector.dart';
import 'package:great_talk/presentation/notifier/terms/terms_notifier.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TermsScreen extends ConsumerWidget {
  const TermsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = TextStyle(
      color: Theme.of(context).focusColor,
      fontSize: 20.0,
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(MsgConstants.wrongInfoMsg, style: style),
                const Divider(),
                TextButton(
                  onPressed: () async => await UrlRedirector.toTosPage(),
                  child: Text(MsgConstants.tosText, style: style),
                ),
                const Divider(),
                TextButton(
                  onPressed: () async => await UrlRedirector.toPrivacyPage(),
                  child: Text(MsgConstants.privacyPolicyText, style: style),
                ),
                const Divider(),
                RoundedButton(
                  press:
                      ref
                          .read(termsNotifierProvider.notifier)
                          .onAgreeButtonPressed,
                  text: MsgConstants.agreeText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
