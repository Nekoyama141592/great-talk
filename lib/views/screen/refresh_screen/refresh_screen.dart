import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/post/post.dart';
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
                            crossAxisCount: 3),
                    itemBuilder: (c, i) {
                      final post = Post.fromJson(docsController.docs[i].data());
                      return Obx(() => CurrentUserController.to
                              .isValidPost(post.postId)
                          ? TextButton(
                              onPressed: () => Get.toNamed(
                                  '/chat/users/${post.typedPoster().uid}/posts/${post.postId}'),
                              child: Text(post.typedTitle().value))
                          : const Text("不適切"));
                    })));
  }
}
