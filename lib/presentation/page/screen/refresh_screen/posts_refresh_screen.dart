import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';
import 'package:great_talk/presentation/notifier/refresh_interface.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/component/post_card.dart';
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsRefreshScreen extends HookWidget {
  const PostsRefreshScreen({
    super.key,
    required this.userPosts,
    required this.notifier,
    this.title,
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
      return Container(
        decoration: const BoxDecoration(
          color: kContentColorDarkTheme,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.post_add_rounded,
                  size: 48,
                  color: kPrimaryColor.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title ?? 'No posts yet',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Posts will appear here when they are created',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    
    return Container(
      decoration: const BoxDecoration(
        color: kContentColorDarkTheme,
      ),
      child: SmartRefresher(
        controller: refreshController,
        enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
        enablePullUp: true,
        header: const WaterDropHeader(),
        onLoading: () async {
          final result = await notifier().onLoading();
          result.when(
            success:
                (_) => ToastUiUtil.showSuccessSnackBar(context, '追加の読み込みが完了しました'),
            failure:
                (_) => ToastUiUtil.showFailureSnackBar(context, '追加の読み込みが失敗しました'),
          );
          refreshController.loadComplete();
        },
        child: CustomScrollView(
          slivers: [
            // Header section with post count
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kContentColorDarkTheme.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: kPrimaryColor.withValues(alpha: 0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withValues(alpha: 0.1),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.dynamic_feed_rounded,
                        color: kPrimaryColor.withValues(alpha: 0.8),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? 'Posts Feed',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${userPosts.length} ${userPosts.length == 1 ? 'post' : 'posts'}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Posts list
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final userPost = userPosts[index];
                  final base64 = userPost.base64;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: PostCard(
                      post: userPost.post,
                      base64: base64,
                      publicUserEntity: userPost.user,
                    ),
                  );
                },
                childCount: userPosts.length,
              ),
            ),
            
            // Bottom spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
