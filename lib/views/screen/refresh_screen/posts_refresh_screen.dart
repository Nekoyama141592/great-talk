import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/model/view_model_state/common/user_post/user_post.dart';
import 'package:great_talk/provider/view_model/refresh_interface.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
import 'package:great_talk/views/components/post_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsRefreshScreen extends HookWidget {
  const PostsRefreshScreen({
    super.key,
    required this.userPosts,
    required this.notifier,
    this.title
  });
  final List<UserPost> userPosts;
  final RefreshInterface Function() notifier;
  final String? title;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      return refreshController.dispose;
    }, []);
    if (userPosts.isEmpty) {
      return Align(alignment: Alignment.center, child: Text(title ?? 'データがありません'));
    }
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
      enablePullUp: true,
      header: const WaterDropHeader(),
      onLoading: () async {
        final result = await notifier().onLoading();
        result.when(
          success:
              (_) => ToastUiCore.showSuccessSnackBar(context, '追加の読み込みが完了しました'),
          failure:
              (_) => ToastUiCore.showFailureSnackBar(context, '追加の読み込みが失敗しました'),
        );
        refreshController.loadComplete();
      },
      child: GridView.builder(
        itemCount: userPosts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (c, i) {
          final userPost = userPosts[i];
          final base64 = userPost.base64;
          return PostCard(
            post: userPost.post,
            base64: base64,
            publicUser: userPost.user,
          );
        },
      ),
    );
  }
}
