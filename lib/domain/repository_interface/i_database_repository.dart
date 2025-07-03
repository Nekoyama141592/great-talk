import 'package:great_talk/domain/entity/database/private_user/private_user_entity.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/timeline/timeline.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/tokens.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

/// Abstract interface for database operations including user management,
/// post operations, follow/mute functionality, and timeline management.
abstract class IDatabaseRepository {
  // Count operations
  Future<int?> countUsers();
  Future<int?> countPosts();
  Future<int?> countMessages();

  // User creation
  Future<PublicUserEntity?> createPublicUser(
    String uid,
    Map<String, dynamic> json,
  );

  Future<PrivateUserEntity?> createPrivateUser(
    String uid,
    Map<String, dynamic> json,
  );

  // User operations
  Future<PublicUserEntity?> getPublicUser(String uid);
  Future<PrivateUserEntity?> getPrivateUser(String uid);
  FutureResult<bool> deletePublicUser(String uid);

  // Post operations
  FutureResult<bool> createPost(
    String uid,
    String postId,
    Map<String, dynamic> json,
  );

  Future<PostEntity?> getPost(String uid, String postId);
  FutureResult<bool> deletePost(String uid, String postId);

  // User update logs
  FutureResult<bool> createUserUpdateLog(String uid, Map<String, dynamic> json);

  // Follow operations
  FutureResult<bool> createFollowInfo(String currentUid, String passiveUid);

  FutureResult<bool> deleteFollowInfoList(
    String currentUid,
    String passiveUid,
    String tokenId,
  );

  // Mute user operations
  FutureResult<bool> createMuteUserInfo(String currentUid, String passiveUid);

  FutureResult<bool> deleteMuteUserInfo(
    String currentUid,
    String passiveUid,
    String tokenId,
  );

  // Mute post operations
  FutureResult<bool> createMutePostInfo(
    String currentUid,
    String postUid,
    String postId,
  );

  FutureResult<bool> deleteMutePostInfo(
    String currentUid,
    String postUid,
    String postId,
    String tokenId,
  );

  // Like post operations
  FutureResult<bool> createLikePostInfo(
    String currentUid,
    String postUid,
    String postId,
  );

  FutureResult<bool> deleteLikePostInfo(
    String currentUid,
    String postUid,
    String postId,
    String tokenId,
  );

  // Token operations
  Future<Tokens> getTokens(String uid);

  // Timeline operations
  Future<List<Timeline>> getTimelines(String currentUid);
  Future<List<PostEntity>> getTimelinePosts(List<String> postIds);
  Future<List<Timeline>> getMoreTimelines(
    String currentUid,
    String lastTimelinePostId,
  );

  // User list operations
  Future<List<PublicUserEntity>> getUsersByUids(List<String> uids);
  Future<List<PublicUserEntity>> getRankingUsers();
  Future<List<PublicUserEntity>> getMoreRankingUsers(String lastUserUid);
  Future<List<PublicUserEntity>> getMuteUsers(List<String> requestUids);
  Future<List<PublicUserEntity>> getMoreMuteUsers(
    List<String> requestUids,
    String lastUserUid,
  );

  // Post list operations
  Future<List<PostEntity>> getUserPosts(String uid);
  Future<List<PostEntity>> getMoreUserPosts(String uid, String lastPostId);
  Future<List<PostEntity>> getPosts(bool isRankingPosts);
  Future<List<PostEntity>> getMorePosts(
    bool isRankingPosts,
    String lastPostUid,
    String lastPostId,
  );
  Future<List<PostEntity>> getMutePosts(List<String> postIds);
  Future<List<PostEntity>> getMoreMutePosts(
    List<String> postIds,
    String lastPostUid,
    String lastPostId,
  );
}
