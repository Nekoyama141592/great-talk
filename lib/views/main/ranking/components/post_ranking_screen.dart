import 'package:flutter/material.dart';
import 'package:great_talk/providers/view_model/posts/posts_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/screen/refresh_screen/posts_refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostRankingScreen extends ConsumerWidget {
  const PostRankingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(postsViewModelProvider(true));
    PostsViewModel notifier() =>
        ref.read(postsViewModelProvider(true).notifier);
    return AsyncScreen(
      asyncValue: asyncValue,
      data: (state) {
        return PostsRefreshScreen(
          userPosts: state.userPosts,
          notifier: notifier,
        );
      },
    );
  }
}
