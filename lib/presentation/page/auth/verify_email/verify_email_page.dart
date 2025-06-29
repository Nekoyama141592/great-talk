import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';
import 'package:great_talk/presentation/notifier/verify_email/verify_email_view_model.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class VerifyEmailPage extends HookConsumerWidget {
  const VerifyEmailPage({super.key});
  static const path = "/verify-email";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(verifyEmailViewModelProvider);
    VerifyEmailViewModel notifier() =>
        ref.read(verifyEmailViewModelProvider.notifier);
    final timer = useRef<Timer?>(null);

    // タイマーの初期化とクリーンアップ
    useEffect(() {
      void startTimer() {
        timer.value?.cancel();
        timer.value = Timer.periodic(const Duration(seconds: 1), (t) {
          final currentState = ref.read(verifyEmailViewModelProvider).value;
          if (currentState?.resendSecondsLeft == 0) {
            t.cancel();
          } else {
            notifier().decrementResendSeconds();
          }
        });
      }

      // 初期状態でタイマーを開始
      final state = ref.read(verifyEmailViewModelProvider).value;
      if (state?.resendSecondsLeft != null && state!.resendSecondsLeft > 0) {
        startTimer();
      }

      return () {
        timer.value?.cancel();
      };
    }, []);

    Future<void> handleResendEmail() async {
      final result = await notifier().resendVerificationEmail();

      result.when(
        success: (_) {
          if (context.mounted) {
            ToastUiUtil.showSuccessSnackBar(
              context,
              '確認メールを送信しました。メールをご確認ください。',
            );
            // タイマーを再開始
            timer.value?.cancel();
            timer.value = Timer.periodic(const Duration(seconds: 1), (t) {
              final currentState = ref.read(verifyEmailViewModelProvider).value;
              if (currentState?.resendSecondsLeft == 0) {
                t.cancel();
              } else {
                notifier().decrementResendSeconds();
              }
            });
          }
        },
        failure: (message) {
          if (context.mounted) {
            ToastUiUtil.showFailureSnackBar(context, message);
          }
        },
      );
    }

    Future<void> handleCheckEmailVerification() async {
      final result = await notifier().checkEmailVerification();

      result.when(
        success: (_) {
          ref.invalidate(streamAuthProvider); // 初期化
        },
        failure: (message) {
          if (context.mounted) {
            ToastUiUtil.showFailureSnackBar(context, message);
          }
        },
      );
    }

    Future<void> handleSignOut() async {
      final result = await notifier().signOut();

      result.when(
        success: (_) {
          if (context.mounted) {
            RouteUtil.pushReplace(context);
          }
        },
        failure: (message) {
          if (context.mounted) {
            ToastUiUtil.showFailureSnackBar(context, message);
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('メールアドレス確認'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: handleSignOut, child: const Text('ログアウト')),
        ],
      ),
      body: AsyncScreen(
        asyncValue: asyncValue,
        data:
            (state) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtil.defaultPadding(context),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 80,
                        color: Colors.blue,
                      ),
                      const BasicHeightBox(),
                      const Text(
                        'メールアドレスの確認',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const BasicHeightBox(),
                      Text(
                        '${state.email}\nに確認メールを送信しました。',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const BasicHeightBox(),
                      const Text(
                        'メール内のリンクをクリックして\nメールアドレスを確認してください。',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const BasicHeightBox(),
                      const BasicHeightBox(),
                      RoundedButton(
                        text:
                            state.canResend
                                ? '確認メールを再送信'
                                : '再送信まで${state.resendSecondsLeft}秒',
                        textColor: Colors.white,
                        buttonColor: Theme.of(context).primaryColor,
                        press: handleResendEmail,
                        enabled: state.canResend,
                      ),
                      const BasicHeightBox(),
                      RoundedButton(
                        text: '確認完了をチェック',
                        textColor: Theme.of(context).primaryColor,
                        buttonColor: Colors.transparent,
                        press: handleCheckEmailVerification,
                        enabled: !asyncValue.isLoading,
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
