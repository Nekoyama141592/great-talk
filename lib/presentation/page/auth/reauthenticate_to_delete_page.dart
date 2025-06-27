import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:great_talk/core/provider/keep_alive/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/core/util/route_core.dart';
import 'package:great_talk/presentation/common/toast_ui_core.dart';
import 'package:great_talk/presentation/page/auth/user_deleted_page.dart';
import 'package:great_talk/presentation/page/screen/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ReauthenticateToDeletePage extends ConsumerWidget {
  const ReauthenticateToDeletePage({super.key});
  static const path = "/reauthenticate/delete";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(currentUserNotifierProvider.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("ユーザーを削除")),
        body: LoginScreen(
          onAppleButtonPressed: () async {
            final result = await notifier.reauthenticateWithAppleToDelete();
            result.when(
              success: (_) async {
                final deleteResult = await notifier.deletePublicUser();
                deleteResult.when(
                  success:
                      (_) => RouteCore.pushPath(context, UserDeletedPage.path),
                  failure:
                      (_) => ToastUiCore.showFailureSnackBar(
                        context,
                        "ユーザーを削除できませんでした",
                      ),
                );
              },
              failure: (msg) => ToastUiCore.showFailureSnackBar(context, msg),
            );
          },
          onGoogleButtonPressed: () async {
            final result = await notifier.reauthenticateWithGoogleToDelete();
            result.when(
              success: (_) async {
                final deleteResult = await notifier.deletePublicUser();
                deleteResult.when(
                  success:
                      (_) => RouteCore.pushPath(context, UserDeletedPage.path),
                  failure:
                      (msg) => ToastUiCore.showFailureSnackBar(context, msg),
                );
              },
              failure:
                  (_) => ToastUiCore.showFailureSnackBar(
                    context,
                    "Googleでの再認証に失敗しました",
                  ),
            );
          },
          title: "ユーザーの削除には再認証が必要です",
        ),
      ),
    );
  }
}
