import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/post_card.dart';
import 'package:great_talk/views/screen/loading_screen.dart';
import 'package:great_talk/views/screen/refresh_screen/components/reload_screen/reload_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshScreen extends HookWidget {
  const RefreshScreen({
    Key? key,
    required this.docsController,
    this.reloadMsg,
    this.child,
  }) : super(key: key);
  final DocsController docsController;
  final String? reloadMsg;
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
    return Obx(() {
      if (docsController.cannotShow()) {
        return const LoadingScreen();
      }
      if (docsController.docs.isEmpty) {
        return ReloadScreen(
          onReload: docsController.onReload,
          reloadMsg: reloadMsg,
        );
      }
      return SmartRefresher(
          controller: refreshController,
          enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
          enablePullUp: true,
          header: const WaterDropHeader(),
          onLoading: () => docsController.onLoading(refreshController),
          child: child ??
              GridView.builder(
                  itemCount: docsController.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.5),
                  itemBuilder: (c, i) {
                    final post =
                        Post.fromJson(docsController.docs[i].doc.data());
                    final uint8list = docsController.docs[i].uint8list;
                    return PostCard(post: post, uint8list: uint8list);
                  }));
    });
  }
}
