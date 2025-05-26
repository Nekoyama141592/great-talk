import 'package:flutter/material.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/providers/view_model/docs/docs_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/components/user_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserRankingScreen extends ConsumerWidget {
  const UserRankingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(docsViewModelProvider(DocsType.rankingUsers));
    final notifier = ref.read(docsViewModelProvider(DocsType.rankingUsers).notifier);
    return AsyncScreen(asyncValue: asyncValue, data: (state) {
      final qDocInfoList = state.qDocInfoList;
      return RefreshScreen(state: state, onReload:notifier. onReload, onLoading:notifier. onLoading,child: ListView.builder(
          itemCount: qDocInfoList.length,
          itemBuilder: (c, i) {
            final publicUser = PublicUser.fromJson(
              qDocInfoList[i].qDoc.data(),
            );
            final uint8list = qDocInfoList[i].userImage;
            return UserCard(publicUser: publicUser, uint8list: uint8list);
          },
        ),);
    });
  }
}
