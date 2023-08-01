import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  Future<void> createPost(DocRef postRef, SDMap json) async =>
      await postRef.set(json);
  Future<void> createPostLike(
          DocRef postRef, String tokenId, SDMap json) async =>
      await FirestoreQueries.postLikeDocRef(postRef, tokenId).set(json);

  Future<void> createUser(String uid, SDMap json) async =>
      await FirestoreQueries.userQuery(uid).set(json);

  Future<void> createUserUpdateLog(String uid, SDMap json) async =>
      await FirestoreQueries.userUpdateLogDocRef(uid).set(json);

  Future<void> createFollower(
          String currentUid, String passiveUid, SDMap json) async =>
      await FirestoreQueries.followerQuery(currentUid, passiveUid).set(json);
  Future<void> deleteFollower(String currentUid, String passiveUid) async =>
      await FirestoreQueries.followerQuery(currentUid, passiveUid).delete();

  Future<void> createPostReport(DocRef postRef, SDMap json) async =>
      await FirestoreQueries.postReportDocRefFromPostRef(postRef).get();
  Future<void> createToken(
          String currentUid, String tokenId, SDMap json) async =>
      await FirestoreQueries.tokenQuery(currentUid, tokenId).set(json);
  Future<void> deleteToken(String currentUid, String tokenId) async =>
      await FirestoreQueries.tokenQuery(currentUid, tokenId).delete();

  FutureDoc getPost(String uid, String postId) async =>
      await FirestoreQueries.postDocRef(uid, postId).get();
  FutureQSnapshot getPostsByFollowing(List<String> followingUids) async =>
      await FirestoreQueries.postsQueryByFollowing(followingUids).get();
  FutureQSnapshot getNewPostsByFollowing(
          List<String> followingUids, Doc firstDoc) async =>
      await FirestoreQueries.newPostsQueryByFollowing(followingUids, firstDoc)
          .get();
  FutureQSnapshot getMorePostsByFollowing(
          List<String> followingUids, Doc lastDoc) async =>
      await FirestoreQueries.morePostsQueryByFollowing(followingUids, lastDoc)
          .get();

  FutureQSnapshot getPostsByLikeCount() async =>
      await FirestoreQueries.postsQueryByLikeCount.get();
  FutureQSnapshot getMorePostsByLikeCount(Doc lastDoc) async =>
      await FirestoreQueries.morePostsQueryByLikeCount(lastDoc).get();

  FutureQSnapshot getTimelinePosts(List<String> timelinePostIds) async =>
      await FirestoreQueries.timelinePostsQuery(timelinePostIds).get();

  FutureQSnapshot getTimelines(DocRef userRef) async =>
      await FirestoreQueries.timelinesQuery(userRef).get();
  FutureQSnapshot getNewTimelines(DocRef userRef, Doc firstDoc) async =>
      await FirestoreQueries.newTimelinesQuery(userRef, firstDoc).get();
  FutureQSnapshot getMoreTimelines(DocRef userRef, Doc lastDoc) async =>
      await FirestoreQueries.moreTimelinesQuery(userRef, lastDoc).get();

  FutureDoc getUser(String uid) async =>
      await FirestoreQueries.userQuery(uid).get();
  FutureDoc getCurrentUser(String uid) async => getUser(uid);

  FutureQSnapshot getUsersByFollowerCount() async =>
      await FirestoreQueries.usersQueryByLikeCount.get();
  FutureQSnapshot getMoreUsersByFollowerCount(Doc lastDoc) async =>
      await FirestoreQueries.moreUsersQueryByLikeCount(lastDoc).get();

  FutureQSnapshot getUserPostsByNewest(String uid) async =>
      await FirestoreQueries.userPostsQueryByNewest(uid).get();
  FutureQSnapshot getMoreUserPostsByNewest(String uid, Doc lastDoc) async =>
      await FirestoreQueries.moreUserPostsQueryByNewest(uid, lastDoc).get();
  FutureQSnapshot getNewUserPostsByNewest(String uid, Doc firstDoc) async =>
      await FirestoreQueries.newUserPostsQueryByNewest(uid, firstDoc).get();

  FutureQSnapshot searchUsers(String searchTerm) async =>
      await FirestoreQueries.userSearchQuery(searchTerm).get();
  FutureQSnapshot searchMoreUsers(String searchTerm, Doc lastDoc) async =>
      await FirestoreQueries.moreUserSearchQuery(searchTerm, lastDoc).get();
  FutureQSnapshot searchUserPosts(String uid, String searchTerm) async =>
      await FirestoreQueries.userPostsSearchQuery(uid, searchTerm).get();
  FutureQSnapshot searchMoreUserPosts(
          String uid, String searchTerm, Doc lastDoc) async =>
      await FirestoreQueries.moreUserPostsSearchQuery(uid, searchTerm, lastDoc)
          .get();
}
