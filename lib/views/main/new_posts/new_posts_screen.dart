import 'package:flutter/material.dart';
import 'package:great_talk/providers/view_model/posts/posts_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewPostsScreen extends ConsumerWidget {
  const NewPostsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(postsViewModelProvider(false));
    final notifier = ref.read(
      postsViewModelProvider(false).notifier,
    );
    return Scaffold(
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          return RefreshScreen(
            userPosts: state.userPosts,
            onLoading: notifier.onLoading,
          );
        },
      ),
    );
  }
}
