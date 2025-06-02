import 'dart:convert';

import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/view_model_state/common/user_post/user_post.dart';
import 'package:great_talk/providers/usecase/file/file_usecase.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'posts_use_case.g.dart';

@riverpod
PostsUseCase postsUseCase(Ref ref) => PostsUseCase(ref.watch(firestoreRepositoryProvider),ref.watch(fileUseCaseProvider));

class PostsUseCase {
  PostsUseCase(this.repository,this.fileUseCase);
  final FirestoreRepository repository;
  final FileUseCase fileUseCase;
  Future<String?> _getImageFromPost(Post post) async {
    final detectedImage = post.typedImage();
    final image = await fileUseCase.getS3Image(detectedImage.bucketName, detectedImage.value);
    if (image == null) return null;
    return base64Encode(image);
  }
  List<Post> sortedPosts(List<Post> posts) {
    return posts..sort((a, b) => (b.createdAt).compareTo(a.createdAt));
  }
  Future<List<UserPost>> createUserPosts(List<Post> posts) async {
    final sorted = sortedPosts(posts);
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
            return UserPost(
              user: publicUser,
              post:  element,
              base64:userImage,
            );
          }),
    );
    return userPosts;
  }
}