import 'package:flutter/material.dart';
import 'package:great_talk/presentation/notifier/timelines/timelines_view_model.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/posts_refresh_screen.dart';
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
          title: '人気ユーザーをフォローしてみましょう！',
        );
      },
    );
  }
}
