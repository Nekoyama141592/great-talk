import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshScreen extends HookWidget {
  const RefreshScreen({
    Key? key,
    required this.docsController,
    this.child,
  }) : super(key: key);
  final DocsController docsController;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await docsController.init();
      });
      return refreshController.dispose;
    }, []);
    return Obx(() => docsController.cannotShow()
        ? const CircularProgressIndicator()
        : SmartRefresher(
            controller: refreshController,
            enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
            enablePullUp: true,
            header: const WaterDropHeader(),
            onLoading: () => docsController.onLoading(refreshController),
            onRefresh: () => docsController.onRefresh(refreshController),
            child: child ??
                ListView.builder(
                    itemCount: docsController.docs.length,
                    itemBuilder: (c, i) {
                      final post = Post.fromJson(docsController.docs[i].data());
                      final content = ChatContent.fromPost(post);
                      return Obx(() =>
                          CurrentUserController.to.isValidPost(post.postId)
                              ? PostCard(
                                  chatContent: content,
                                  post: post,
                                  onTap: () => Get.toNamed(
                                      '/chat/users/${content.posterUid}/posts/${content.contentId}'),
                                )
                              : const SizedBox.shrink());
                    })));
  }
}
