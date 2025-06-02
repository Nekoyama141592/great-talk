import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/providers/view_model/mute_posts/mute_posts_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MutePostsPage extends ConsumerWidget {
  const MutePostsPage({super.key});
  static const path = "/mutePosts";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(mutePostsViewModelProvider);
    MutePostsViewModel notifier() => ref.read(mutePostsViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("ミュートしている投稿一覧")),
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          return RefreshScreen(
            userPosts: state.userPosts,
            onLoading: notifier().onLoading,
          );
        },
      ),
    );
  }
}
