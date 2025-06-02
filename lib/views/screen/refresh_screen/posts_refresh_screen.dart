import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/model/view_model_state/common/user_post/user_post.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/views/components/post_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsRefreshScreen extends HookWidget {
  const PostsRefreshScreen({
    super.key,
    required this.userPosts,
    required this.onLoading,
  });
  final List<UserPost> userPosts;
  final FutureResult<bool> Function() onLoading;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      return refreshController.dispose;
    }, []);
    if (userPosts.isEmpty) {
      return Align(alignment: Alignment.center, child: const Text('データがありません'));
    }
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
      enablePullUp: true,
      header: const WaterDropHeader(),
      onLoading: () async {
        final result = await onLoading();
        result.when(success: (_) => UIHelper.showSuccessSnackBar(context, '追加の読み込みが完了しました'), failure: (_) => UIHelper.showFailureSnackBar(context, '追加の読み込みが失敗しました'));
        refreshController.loadComplete();
      },
      child:
          GridView.builder(
            itemCount: userPosts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
            ),
            itemBuilder: (c, i) {
              final userPost = userPosts[i];
              final base64 = userPost.base64;
              return PostCard(post: userPost.post,base64: base64,publicUser: userPost.user,);
            },
          ),
    );
  }
}
