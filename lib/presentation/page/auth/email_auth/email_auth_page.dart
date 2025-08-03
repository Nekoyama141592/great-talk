import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/presentation/notifier/email_auth/email_auth_view_model.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_header.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_form.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_actions.dart';
import 'package:great_talk/presentation/page/auth/reset_password/reset_password_page.dart';
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class EmailAuthPage extends HookConsumerWidget {
  const EmailAuthPage({super.key});
  static const path = "/email-auth";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final state = ref.watch(emailAuthViewModelProvider);
    EmailAuthViewModel notifier() =>
        ref.read(emailAuthViewModelProvider.notifier);

    // useMemorizedでFormKeyを生成
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // バリデーション関数
    String? emailValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'メールアドレスを入力してください';
      }
      // 簡易メールアドレス形式チェック
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(value)) {
        return '有効なメールアドレスを入力してください';
      }
      return null;
    }

    String? passwordValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'パスワードを入力してください';
      }
      if (value.length < 6) {
        return '6文字以上のパスワードを入力してください';
      }
      return null;
    }

    Future<void> handleAuth() async {
      // formKeyでバリデーション
      if (!(formKey.currentState?.validate() ?? false)) {
        ToastUiUtil.showFailureSnackBar(context, '入力内容を確認してください');
        return;
      }

      final result = await notifier().authenticate(
        emailController.text,
        passwordController.text,
      );

      result.when(
        success: (_) {
          ToastUiUtil.showSuccessSnackBar(
            context,
            state.isSignUp ? 'アカウントを作成しました' : 'ログインしました',
          );
          RouteUtil.pushReplace(context);
        },
        failure: (msg) => ToastUiUtil.showFailureSnackBar(context, msg),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: EmailAuthHeader(isSignUp: state.isSignUp),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtil.defaultPadding(context),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400, // 最大幅を制限（必要に応じて調整）
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EmailAuthForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      emailValidator: emailValidator,
                      passwordValidator: passwordValidator,
                    ),
                    EmailAuthActions(
                      isSignUp: state.isSignUp,
                      isLoading: state.isLoading,
                      onAuth: handleAuth,
                      onToggleSignUpMode: notifier().toggleSignUpMode,
                    ),
                    if (!state.isSignUp) ...[
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          RouteUtil.pushPath(context, ResetPasswordPage.path);
                        },
                        child: const Text(
                          'パスワードを忘れた方はこちら',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
