import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/application/use_case/file/file_use_case.dart';
import 'package:great_talk/domain/use_case_interface/posts/i_posts_use_case.dart';

class PostsUseCase implements IPostsUseCase {
  PostsUseCase({required this.repository, required this.fileUseCase});
  final DatabaseRepository repository;
  final FileUseCase fileUseCase;
  Future<String?> _getImageFromPost(Post post) async {
    final detectedImage = post.typedImage();
    final image = await fileUseCase.getObject(
      detectedImage.bucketName,
      detectedImage.value,
    );
    return image;
  }

  List<Post> _getSorted(List<Post> posts, bool isRankingPosts) {
    return isRankingPosts ? _sortByLikeCount(posts) : _sortByCreatedAt(posts);
  }

  List<Post> _sortByCreatedAt(List<Post> posts) {
    return posts
      ..sort((a, b) => (b.typedCreatedAt()).compareTo(a.typedCreatedAt()));
  }

  List<Post> _sortByLikeCount(List<Post> posts) {
    return posts..sort((a, b) => (b.likeCount).compareTo(a.likeCount));
  }

  @override
  Future<List<UserPost>> createUserPosts(
    List<Post> posts, {
    bool isRankingPosts = false,
  }) async {
    if (posts.isEmpty) return [];
    final sorted = _getSorted(posts, isRankingPosts);
    final uids = sorted.map((e) => e.uid).toList();
    final fetchedUsers = await repository.getUsersByUids(uids);
    final userMap = {for (final user in fetchedUsers) user.uid: user};
    final userPosts = await Future.wait(
      sorted
          .where((element) {
            final uid = element.uid;
            return userMap.containsKey(uid);
          })
          .map((element) async {
            final publicUser = userMap[element.uid]!;
            final userImage = await _getImageFromPost(element);
            return UserPost(user: publicUser, post: element, base64: userImage);
          }),
    );
    return userPosts;
  }
}
