import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/views/mute/mute_posts/component/mute_post_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MutePostsPage extends ConsumerWidget {
  const MutePostsPage({super.key});
  static const path = "/mutePosts";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = Get.put(DocsController(DocsType.mutePosts));
    return Scaffold(
      appBar: AppBar(title: const Text("ミュートしている投稿一覧")),
      body: RefreshScreen(
        currentUid: ref.watch(streamAuthUidProvider).value!,
        docsController: controller,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.state.value.qDocInfoList.length,
            itemBuilder: (c, i) {
              final post = Post.fromJson(
                controller.state.value.qDocInfoList[i].qDoc.data(),
              );
              final uint8list =
                  controller.state.value.qDocInfoList[i].userImage;
              return MutePostCard(
                post: post,
                uint8list: uint8list,
                onTap: controller.onMutePostCardTap,
              );
            },
          ),
        ),
      ),
    );
  }
}
