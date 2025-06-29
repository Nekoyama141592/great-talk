import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/presentation/notifier/mute_posts/mute_posts_view_model.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/posts_refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MutePostsPage extends ConsumerWidget {
  const MutePostsPage({super.key});
  static const path = "/mutePosts";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(mutePostsViewModelProvider);
    MutePostsViewModel notifier() =>
        ref.read(mutePostsViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("ミュートしている投稿一覧")),
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          return PostsRefreshScreen(
            userPosts: state.userPosts,
            notifier: notifier,
          );
        },
      ),
    );
  }
}
