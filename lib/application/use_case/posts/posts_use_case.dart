import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/use_case_interface/posts/i_posts_use_case.dart';

class PostsUseCase implements IPostsUseCase {
  PostsUseCase({required this.repository});
  final DatabaseRepository repository;

  List<PostEntity> _getSorted(List<PostEntity> posts, bool isRankingPosts) {
    return isRankingPosts ? _sortByLikeCount(posts) : _sortByCreatedAt(posts);
  }

  List<PostEntity> _sortByCreatedAt(List<PostEntity> posts) {
    return posts..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  List<PostEntity> _sortByLikeCount(List<PostEntity> posts) {
    return posts..sort((a, b) => (b.msgCount).compareTo(a.msgCount));
  }

  @override
  Future<List<UserPost>> createUserPosts(
    List<PostEntity> posts, {
    bool isRankingPosts = false,
  }) async {
    if (posts.isEmpty) return [];
    final sorted = _getSorted(posts, isRankingPosts);
    final uids = sorted.map((e) => e.uid).toList();
    final fetchedUsers = await repository.getUsersByUids(uids);
    final userMap = {for (final user in fetchedUsers) user.uid: user};
    final userPosts =
        sorted
            .where((element) {
              final uid = element.uid;
              return userMap.containsKey(uid);
            })
            .map((element) {
              final publicUserEntity = userMap[element.uid]!;
              return UserPost(user: publicUserEntity, post: element);
            })
            .toList();
    return userPosts;
  }
}
