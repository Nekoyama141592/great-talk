import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_report_button.dart';
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
                GridView.builder(
                    itemCount: docsController.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 0.6),
                    itemBuilder: (c, i) {
                      final post = Post.fromJson(docsController.docs[i].data());
                      final content = ChatContent.fromPost(post);
                      return Obx(() => CurrentUserController.to
                              .isValidPost(post.postId)
                          ? Padding(
                              padding: EdgeInsets.all(defaultPadding(context)),
                              child: Column(
                                children: [
                                  CircleImage(
                                    imageValue: content.imageValue,
                                    onTap: () => Get.toNamed(
                                        '/chat/users/${post.typedPoster().uid}/posts/${post.postId}'),
                                  ),
                                  Text(
                                    post.typedTitle().value,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "by ${post.typedPoster().typedUserName().value}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                  Center(
                                    child: Row(
                                      children: [
                                        PostLikeButton(
                                          post: post,
                                        ),
                                        const Spacer(),
                                        PostReportButton(post: post)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const Text("不適切"));
                    })));
  }
}
