import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/core/provider/view_model/email_auth/email_auth_view_model.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';
import 'package:great_talk/core/util/size_util.dart';
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
        appBar: AppBar(title: Text(state.isSignUp ? 'アカウント作成' : 'ログイン')),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtil.defaultPadding(context),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 400, // 最大幅を制限（必要に応じて調整）
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'メールアドレス',
                          border: OutlineInputBorder(),
                        ),
                        validator: emailValidator,
                      ),
                      const BasicHeightBox(),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'パスワード',
                          border: OutlineInputBorder(),
                        ),
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 32),
                      RoundedButton(
                        text: state.isSignUp ? 'アカウントを作成' : 'ログイン',
                        textColor: Colors.white,
                        buttonColor: Theme.of(context).primaryColor,
                        press: state.isLoading ? null : handleAuth,
                      ),
                      const BasicHeightBox(),
                      TextButton(
                        onPressed: notifier().toggleSignUpMode,
                        child: Text(
                          state.isSignUp
                              ? 'すでにアカウントをお持ちですか？ログイン'
                              : 'アカウントをお持ちでない方はアカウント作成',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
