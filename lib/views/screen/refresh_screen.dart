import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshScreen extends HookWidget {
  const RefreshScreen({
    Key? key,
    required this.docsController,
    // required this.child,
  }) : super(key: key);
  final DocsController docsController;
  // final Widget child;
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
            child: docsController.isUserDocs
                ? ListView.builder(
                    itemCount: docsController.docs.length,
                    itemBuilder: (c, i) {
                      final user =
                          FirestoreUser.fromJson(docsController.docs[i].data());
                      return Text(user.typedUserName().value);
                    })
                : ListView.builder(
                    itemCount: docsController.docs.length,
                    itemBuilder: (c, i) {
                      final post = Post.fromJson(docsController.docs[i].data());
                      final interlocutor =
                          ChatUser.fromFirestoreUser(post.typedPoster());
                      return ListTile(
                        leading: CircleImage(interlocutor: interlocutor),
                        title: Text(post.postId),
                      );
                    })));
  }
}
