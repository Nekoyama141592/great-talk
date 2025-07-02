import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';
import 'package:great_talk/presentation/state/verify_email/verify_email_state.dart';

class VerifyEmailActions extends StatelessWidget {
  const VerifyEmailActions({
    super.key,
    required this.state,
    required this.isLoading,
    required this.onResendEmail,
    required this.onCheckVerification,
  });

  final VerifyEmailState state;
  final bool isLoading;
  final VoidCallback onResendEmail;
  final VoidCallback onCheckVerification;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
          text:
              state.canResend
                  ? '確認メールを再送信'
                  : '再送信まで${state.resendSecondsLeft}秒',
          textColor: Colors.white,
          buttonColor: Theme.of(context).primaryColor,
          press: onResendEmail,
          enabled: state.canResend,
        ),
        const BasicHeightBox(),
        RoundedButton(
          text: '確認完了をチェック',
          textColor: Theme.of(context).primaryColor,
          buttonColor: Colors.transparent,
          press: onCheckVerification,
          enabled: !isLoading,
        ),
      ],
    );
  }
}
