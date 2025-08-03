import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:great_talk/presentation/notifier/reset_password/reset_password_view_model.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/text_field_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({super.key});
  static const path = "/reset-password";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final state = ref.watch(resetPasswordViewModelProvider);
    final notifier = ref.read(resetPasswordViewModelProvider.notifier);

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

    Future<void> handleSendResetEmail() async {
      // formKeyでバリデーション
      if (!(formKey.currentState?.validate() ?? false)) {
        ToastUiUtil.showFailureSnackBar(context, '入力内容を確認してください');
        return;
      }

      final result = await notifier.sendPasswordResetEmail(
        emailController.text,
      );

      result.when(
        success: (_) {
          ToastUiUtil.showSuccessSnackBar(context, 'パスワードリセットメールを送信しました');
        },
        failure: (msg) => ToastUiUtil.showFailureSnackBar(context, msg),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => RouteUtil.back(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtil.defaultPadding(context),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'パスワードリセット',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const BasicHeightBox(),
                      const Text(
                        'ご登録のメールアドレスにパスワードリセット用のリンクを送信します。',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      TextFieldContainer(
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                          decoration: InputDecoration(
                            hintText: 'メールアドレス',
                            hintStyle: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      RoundedButton(
                        text:
                            notifier.canResend
                                ? 'リセットメールを送信'
                                : '再送信まで ${state.resendLeftTime}秒',
                        press: notifier.canResend ? handleSendResetEmail : null,
                        enabled: notifier.canResend && !state.isLoading,
                      ),
                      const BasicHeightBox(),
                      TextButton(
                        onPressed: () => RouteUtil.back(context),
                        child: const Text(
                          'ログイン画面に戻る',
                          style: TextStyle(color: kPrimaryColor, fontSize: 16),
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
