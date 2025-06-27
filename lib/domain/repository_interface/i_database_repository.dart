import 'package:great_talk/infrastructure/model/database_schema/follower/follower.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/infrastructure/model/database_schema/post_like/post_like.dart';
import 'package:great_talk/infrastructure/model/database_schema/post_mute/post_mute.dart';
import 'package:great_talk/infrastructure/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/infrastructure/model/database_schema/timeline/timeline.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';

/// Abstract interface for database operations including user management,
/// post operations, follow/mute functionality, and timeline management.
abstract class IDatabaseRepository {
  // Count operations
  Future<int?> countUsers();
  Future<int?> countPosts();
  Future<int?> countMessages();

  // User creation
  Future<PublicUser?> createPublicUser(String uid, Map<String, dynamic> json);

  Future<PrivateUser?> createPrivateUser(String uid, Map<String, dynamic> json);

  // User operations
  Future<PublicUser?> getPublicUser(String uid);
  Future<PrivateUser?> getPrivateUser(String uid);
  FutureResult<bool> deletePublicUser(String uid);

  // Post operations
  FutureResult<bool> createPost(
    String uid,
    String postId,
    Map<String, dynamic> json,
  );

  Future<Post?> getPost(String uid, String postId);
  FutureResult<bool> deletePost(Post post);

  // User update logs
  FutureResult<bool> createUserUpdateLog(String uid, Map<String, dynamic> json);

  // Follow operations
  FutureResult<bool> createFollowInfo(
    String currentUid,
    String passiveUid,
    FollowingToken followingToken,
    Follower follower,
  );

  FutureResult<bool> deleteFollowInfoList(
    String currentUid,
    String passiveUid,
    String tokenId,
  );

  // Mute user operations
  FutureResult<bool> createMuteUserInfo(
    String currentUid,
    String passiveUid,
    MuteUserToken token,
    UserMute userMute,
  );

  FutureResult<bool> deleteMuteUserInfo(
    String currentUid,
    String passiveUid,
    String tokenId,
  );

  // Mute post operations
  FutureResult<bool> createMutePostInfo(
    String currentUid,
    Post post,
    MutePostToken token,
    PostMute postMute,
  );

  FutureResult<bool> deleteMutePostInfo(
    String currentUid,
    Post post,
    String tokenId,
  );

  // Like post operations
  FutureResult<bool> createLikePostInfo(
    String currentUid,
    Post post,
    LikePostToken token,
    PostLike postLike,
  );

  FutureResult<bool> deleteLikePostInfo(
    String currentUid,
    Post post,
    String tokenId,
  );

  // Token operations
  Future<List<Map<String, dynamic>>> getTokens(String uid);

  // Timeline operations
  Future<List<Timeline>> getTimelines(String currentUid);
  Future<List<Post>> getTimelinePosts(List<String> postIds);
  Future<List<Timeline>> getMoreTimelines(
    String currentUid,
    Timeline lastTimeline,
  );

  // User list operations
  Future<List<PublicUser>> getUsersByUids(List<String> uids);
  Future<List<PublicUser>> getRankingUsers();
  Future<List<PublicUser>> getMoreRankingUsers(PublicUser lastUser);
  Future<List<PublicUser>> getMuteUsers(List<String> requestUids);
  Future<List<PublicUser>> getMoreMuteUsers(
    List<String> requestUids,
    PublicUser lastUser,
  );

  // Post list operations
  Future<List<Post>> getUserPosts(String uid);
  Future<List<Post>> getMoreUserPosts(Post lastPost);
  Future<List<Post>> getPosts(bool isRankingPosts);
  Future<List<Post>> getMorePosts(bool isRankingPosts, Post lastPost);
  Future<List<Post>> getMutePosts(List<String> postIds);
  Future<List<Post>> getMoreMutePosts(List<String> postIds, Post lastPost);
}
