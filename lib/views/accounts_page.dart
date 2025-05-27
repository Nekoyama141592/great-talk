import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/providers/logic/router/router_logic.dart';
import 'package:great_talk/providers/global/current_user/current_user_notifier.dart';
import 'package:great_talk/views/auth/reauthenticate_to_delete_page.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});
  static const path = "/account";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(currentUserNotifierProvider);
    final notifier = ref.watch(currentUserNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("アカウントページ")),
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          return ListView(
            children: [
              ListTile(title: Text("認証情報: ${state.currentAuthStateString()}")),
              ListTile(title: SelectableText("ユーザーID: ${state.currentUid()}")),
              (() {
                final publicUser = state.publicUser;
                if (publicUser == null || !publicUser.isInappropriate()) {
                  return const SizedBox.shrink();
                }
                return ListTile(
                  title: Text(
                    "非表示の理由: \n${publicUser.inappropriateReason(state.currentUid())}",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              })(),
              state.isLoggedIn()
                  ? ListTile(
                    title: const Text("ログアウトする"),
                    onTap: () => notifier.onLogoutButtonPressed(context),
                  )
                  : const SizedBox.shrink(),
              state.isLoggedIn()
                  ? ListTile(
                    title: const Text("ユーザーを消去する"),
                    onTap:
                        () => RouterLogic.pushPath(
                          context,
                          ReauthenticateToDeletePage.path,
                        ),
                  )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
