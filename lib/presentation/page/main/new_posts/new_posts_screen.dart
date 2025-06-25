import 'package:flutter/material.dart';
import 'package:great_talk/provider/view_model/posts/posts_view_model.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/posts_refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewPostsScreen extends ConsumerWidget {
  const NewPostsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(postsViewModelProvider(false));
    PostsViewModel notifier() =>
        ref.read(postsViewModelProvider(false).notifier);
    return Scaffold(
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
