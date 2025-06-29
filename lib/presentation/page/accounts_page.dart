import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/auth_util.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/auth/logouted/logouted_page.dart';
import 'package:great_talk/presentation/page/auth/reauthenticate_to_delete/reauthenticate_to_delete_page.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
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
                title: Text("認証情報: ${AuthUtil.currentAuthStateString(state)}"),
              ),
              ListTile(title: SelectableText("ユーザーID: $uid")),
              if (isLoggedIn) ...[
                ListTile(
                  title: const Text("ログアウトする"),
                  onTap: () {
                    ToastUiUtil.cupertinoAlertDialog(
                      context,
                      "ログアウトしますが本当によろしいですか？",
                      () async {
                        final result = await notifier.signOut();
                        result.when(
                          success: (_) {
                            RouteUtil.pushPath(context, LogoutedPage.path);
                          },
                          failure: (_) {
                            ToastUiUtil.showFailureSnackBar(
                              context,
                              "ログアウトできませんでした}",
                            );
                            RouteUtil.back(context);
                          },
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("ユーザーを消去する"),
                  onTap:
                      () => RouteUtil.pushPath(
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
