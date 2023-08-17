import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  // count
  Future<int> countUsers() async {
    final snapshot = await FirestoreQueries.usersCollectionGroup.count().get();
    return snapshot.count;
  }

  Future<int> countPosts() async {
    final snapshot = await FirestoreQueries.postsCollectionGroup.count().get();
    return snapshot.count;
  }

  Future<int> countMessages() async {
    final snapshot =
        await FirestoreQueries.messagesCollectionGroup.count().get();
    return snapshot.count;
  }

  Future<int> countSearchLogs() async {
    final snapshot =
        await FirestoreQueries.searchLogsCollectionGroup.count().get();
    return snapshot.count;
  }

  // write
  Future<void> createMessage(DocRef messageRef, SDMap json) async =>
      await messageRef.set(json);

  Future<void> createPost(DocRef postRef, SDMap json) async =>
      await postRef.set(json);
  Future<void> createPostLike(
          DocRef postRef, String activeUid, SDMap json) async =>
      await FirestoreQueries.postLikeDocRef(postRef, activeUid).set(json);
  Future<void> deletePostLike(DocRef postRef, String activeUid) async =>
      await FirestoreQueries.postLikeDocRef(postRef, activeUid).delete();

  Future<void> createUser(String uid, SDMap json) async =>
      await FirestoreQueries.userDocRef(uid).set(json);
  Future<void> createPrivateUser(String uid, SDMap json) async =>
      await FirestoreQueries.privateUserDocRef(uid).set(json);
  Future<void> createSearchLog(String uid, SDMap json) async =>
      await FirestoreQueries.searchLogDocRef(uid).set(json);

  Future<void> createUserUpdateLog(String uid, SDMap json) async =>
      await FirestoreQueries.userUpdateLogDocRef(uid).set(json);

  Future<void> createFollower(
          String currentUid, String passiveUid, SDMap json) async =>
      await FirestoreQueries.followerQuery(currentUid, passiveUid).set(json);
  Future<void> deleteFollower(String currentUid, String passiveUid) async =>
      await FirestoreQueries.followerQuery(currentUid, passiveUid).delete();

  Future<void> createPostReport(
          DocRef postRef, String currentUid, SDMap json) async =>
      await FirestoreQueries.postReportDocRefFromPostRef(postRef, currentUid)
          .set(json);

  Future<void> createPostMute(
          DocRef postRef, String activeUid, SDMap json) async =>
      await FirestoreQueries.postMuteDocRefFromPostRef(postRef, activeUid)
          .set(json);
  Future<void> deletePostMute(DocRef postRef, String activeUid) async =>
      await FirestoreQueries.postMuteDocRefFromPostRef(postRef, activeUid)
          .delete();

  Future<void> createUserMute(
          String passiveUid, String activeUid, SDMap json) async =>
      await FirestoreQueries.userMuteDocRef(passiveUid, activeUid).set(json);
  Future<void> deleteUserMute(String passiveUid, String activeUid) async =>
      await FirestoreQueries.userMuteDocRef(passiveUid, activeUid).delete();

  Future<void> createToken(
          String currentUid, String tokenId, SDMap json) async =>
      await FirestoreQueries.tokenQuery(currentUid, tokenId).set(json);
  Future<void> deleteToken(String currentUid, String tokenId) async =>
      await FirestoreQueries.tokenQuery(currentUid, tokenId).delete();
  Future<void> deleteUser(String uid) async =>
      await FirestoreQueries.userDocRef(uid).delete();
  // read
  FutureQSnapshot getUsersByWhereIn(List<String> uids) async =>
      await FirestoreQueries.usersQueryByWhereIn(uids).get();

  FutureDoc getPost(String uid, String postId) async =>
      await FirestoreQueries.userPostRef(uid, postId).get();

  FutureQSnapshot getPostsByWhereIn(List<String> postIds) async =>
      await FirestoreQueries.postsQueryByWhereIn(postIds).get();

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

  FutureQSnapshot getTokens(String currentUid) async =>
      await FirestoreQueries.tokensQuery(currentUid).get();
  FutureDoc getPublicUser(String uid) async =>
      await FirestoreQueries.userDocRef(uid).get();
  FutureDoc getCurrentUser(String uid) async => getPublicUser(uid);
  FutureDoc getPrivateUser(String uid) async =>
      await FirestoreQueries.privateUserDocRef(uid).get();

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

  FutureQSnapshot searchDocs(MapQuery query) async => await query.get();
  FutureQSnapshot searchMoreDocs(MapQuery query, Doc lastDoc) async =>
      await query.startAfterDocument(lastDoc).get();
}
