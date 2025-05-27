import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/providers/view_model/docs/docs_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/mute/mute_posts/component/mute_post_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class MutePostsPage extends ConsumerWidget {
  const MutePostsPage({super.key});
  static const path = "/mutePosts";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(docsViewModelProvider(DocsType.mutePosts));
    final notifier = ref.watch(
      docsViewModelProvider(DocsType.mutePosts).notifier,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("ミュートしている投稿一覧")),
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          final qDocInfoList = state.qDocInfoList;
          return RefreshScreen(
            state: state,
            onLoading: notifier.onLoading,
            onReload: notifier.onReload,
            child: ListView.builder(
              itemCount: qDocInfoList.length,
              itemBuilder: (c, i) {
                final post = Post.fromJson(qDocInfoList[i].qDoc.data());
                final uint8list = qDocInfoList[i].userImage;
                return MutePostCard(
                  post: post,
                  uint8list: uint8list,
                  onTap: notifier.onMutePostCardTap,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
