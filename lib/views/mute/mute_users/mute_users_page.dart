import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/providers/view_model/docs/docs_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/mute/mute_users/component/mute_user_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MuteUsersPage extends ConsumerWidget {
  const MuteUsersPage({super.key});
  static const path = "/muteUsers";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(docsViewModelProvider(DocsType.muteUsers));
    final notifier = ref.read(
      docsViewModelProvider(DocsType.muteUsers).notifier,
    );
    return Scaffold(
      appBar: AppBar(title: const Text("ミュートしているユーザー一覧")),
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          final qDocInfoList = state.qDocInfoList;
          return RefreshScreen(
            state: state,
            onLoading: notifier.onLoading,
            onReload: notifier.onReload,
            child: ListView.builder(
              itemCount: qDocInfoList.length,
              itemBuilder: (c, i) {
                final passiveUser = PublicUser.fromJson(
                  qDocInfoList[i].qDoc.data(),
                );
                final uint8list = qDocInfoList[i].userImage;
                return MuteUserCard(
                  passiveUser: passiveUser,
                  uint8list: uint8list,
                  onMuteUserCardTap: notifier.onMuteUserCardTap,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
