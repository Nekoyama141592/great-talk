import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:great_talk/core/provider/view_model/ranking_users/ranking_users_view_model.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/component/user_card.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/users_refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserRankingScreen extends ConsumerWidget {
  const UserRankingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(rankingUsersViewModelProvider);
    final notifier = ref.read(rankingUsersViewModelProvider.notifier);
    return AsyncScreen(
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
              final publicUser = imageUser.user;
              final base64 = imageUser.base64;
              final uint8list = base64 != null ? base64Decode(base64) : null;
              return publicUser != null
                  ? UserCard(publicUser: publicUser, uint8list: uint8list)
                  : const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
