import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:great_talk/core/router_core.dart';
import 'package:great_talk/providers/view_model/mute_users/mute_users_view_model.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/mute/mute_users/component/mute_user_card.dart';
import 'package:great_talk/views/screen/refresh_screen/users_refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MuteUsersPage extends ConsumerWidget {
  const MuteUsersPage({super.key});
  static const path = "/muteUsers";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(muteUsersViewModelProvider);
    final notifier = ref.read(muteUsersViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text("ミュートしているユーザー一覧")),
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          final imageUsers = state.imageUsers;
          return UsersRefreshScreen(
            isEmpty: imageUsers.isEmpty,
            onLoading: notifier.onLoading,
            child: ListView.builder(
              itemCount: imageUsers.length,
              itemBuilder: (c, i) {
                final imageUser = imageUsers[i];
                final passiveUser = imageUser.user;
                final base64 = imageUser.base64;
                if (passiveUser == null) {
                  return const SizedBox.shrink();
                }
                return MuteUserCard(
                  passiveUser: passiveUser,
                  uint8list: base64 != null ? base64Decode(base64) : null,
                  onMuteUserCardTap: () async {
                    final result = await notifier.unMuteUser(passiveUser.uid);
                    result.when(
                      success: (_) => RouterCore.back(context),
                      failure: (_) => UIHelper.showFailureSnackBar(context,'失敗しました'),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
