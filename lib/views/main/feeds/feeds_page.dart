import 'package:flutter/material.dart';
import 'package:great_talk/provider/view_model/timelines/timelines_view_model.dart';
import 'package:great_talk/views/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/views/screen/refresh_screen/posts_refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedsPage extends ConsumerWidget {
  const FeedsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(timelinesViewModelProvider);
    TimelinesViewModel notifier() =>
        ref.read(timelinesViewModelProvider.notifier);
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
