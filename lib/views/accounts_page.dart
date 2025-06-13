import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/auth_core.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/core/route_core.dart';
import 'package:great_talk/provider/keep_alive/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
import 'package:great_talk/views/auth/logouted_page.dart';
import 'package:great_talk/views/auth/reauthenticate_to_delete_page.dart';
import 'package:great_talk/views/common/async_page/async_screen/async_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});
  static const path = "/account";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStream = ref.watch(streamAuthProvider);
    final notifier = ref.read(currentUserNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("アカウントページ")),
      body: AsyncScreen(
        asyncValue: authStream,
        data: (state) {
          final uid = state?.uid ?? '';
          final isLoggedIn = state != null && !state.isAnonymous;
          return ListView(
            children: [
              ListTile(
                title: Text("認証情報: ${AuthCore.currentAuthStateString(state)}"),
              ),
              ListTile(title: SelectableText("ユーザーID: $uid")),
              if (isLoggedIn) ...[
                ListTile(
                  title: const Text("ログアウトする"),
                  onTap: () {
                    ToastUiCore.cupertinoAlertDialog(
                      context,
                      "ログアウトしますが本当によろしいですか？",
                      () async {
                        final result = await notifier.signOut();
                        result.when(
                          success: (_) {
                            RouteCore.pushPath(context, LogoutedPage.path);
                          },
                          failure: (_) {
                            ToastUiCore.showFailureSnackBar(
                              context,
                              "ログアウトできませんでした}",
                            );
                            RouteCore.back(context);
                          },
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("ユーザーを消去する"),
                  onTap:
                      () => RouteCore.pushPath(
                        context,
                        ReauthenticateToDeletePage.path,
                      ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
