import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/model/database_schema/user_post/user_post.dart';
import 'package:great_talk/views/components/post_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsRefreshScreen extends HookWidget {
  const PostsRefreshScreen({
    super.key,
    required this.userPosts,
    required this.onLoading,
  });
  final List<UserPost> userPosts;
  final void Function(RefreshController) onLoading;
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
      onLoading: () => onLoading(refreshController),
      child:
          GridView.builder(
            itemCount: userPosts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
            ),
            itemBuilder: (c, i) {
              final info = userPosts[i];
              return PostCard(post: info.post, base64: info.base64, publicUser: info.user);
            },
          ),
    );
  }
}
