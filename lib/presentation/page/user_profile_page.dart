import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/provider/view_model/profile/profile_view_model.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/page/screen/profile_screen/profile_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key, @pathParam this.uid = ''});
  final String uid;
  static const path = "/users/:uid";
  static String generatePath(String uid) => "/users/$uid";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(profileViewModelProvider(uid));
    ProfileViewModel notifier() =>
        ref.read(profileViewModelProvider(uid).notifier);
    return Scaffold(
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          return ProfileScreen(
            state: state,
            passiveUid: uid,
            notifier: notifier,
            follow: notifier().onFollowPressed,
            unFollow: notifier().onUnFollowPressed,
          );
        },
      ),
    );
  }
}
