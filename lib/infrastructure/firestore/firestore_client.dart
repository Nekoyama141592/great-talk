import 'package:great_talk/core/firestore/collection_group_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  // count
  Future<int> countUsers() async {
    final snapshot = await CollectionGroupCore.users.count().get();
    return snapshot.count;
  }

  Future<int> countPosts() async {
    final snapshot = await CollectionGroupCore.posts.count().get();
    return snapshot.count;
  }

  Future<int> countMessages() async {
    final snapshot =
        await CollectionGroupCore.messages.count().get();
    return snapshot.count;
  }

  Future<int> countSearchLogs() async {
    final snapshot =
        await CollectionGroupCore.searchLogs.count().get();
    return snapshot.count;
  }

  // write
  // Future<void> createPostLike(
  //         DocRef postRef, String activeUid, SDMap json) async =>
  //     await FirestoreQueries.postLikeDocRef(postRef, activeUid).set(json);
  // Future<void> deletePostLike(DocRef postRef, String activeUid) async =>
  //     await FirestoreQueries.postLikeDocRef(postRef, activeUid).delete();

  // Future<void> createUser(String uid, SDMap json) async =>
  //     await FirestoreQueries.userDocRef(uid).set(json);
  // Future<void> createPrivateUser(String uid, SDMap json) async =>
  //     await FirestoreQueries.privateUserDocRef(uid).set(json);
  // Future<void> createSearchLog(String uid, SDMap json) async =>
  //     await FirestoreQueries.searchLogDocRef(uid).set(json);

  // Future<void> createUserUpdateLog(String uid, SDMap json) async =>
  //     await FirestoreQueries.userUpdateLogDocRef(uid).set(json);

  // Future<void> createFollower(
  //         String currentUid, String passiveUid, SDMap json) async =>
  //     await FirestoreQueries.followerQuery(currentUid, passiveUid).set(json);
  // Future<void> deleteFollower(String currentUid, String passiveUid) async =>
  //     await FirestoreQueries.followerQuery(currentUid, passiveUid).delete();

  // Future<void> createPostReport(
  //         DocRef postRef, String currentUid, SDMap json) async =>
  //     await FirestoreQueries.postReportDocRefFromPostRef(postRef, currentUid)
  //         .set(json);

  // Future<void> createPostMute(
  //         DocRef postRef, String activeUid, SDMap json) async =>
  //     await FirestoreQueries.postMuteDocRefFromPostRef(postRef, activeUid)
  //         .set(json);
  // Future<void> deletePostMute(DocRef postRef, String activeUid) async =>
  //     await FirestoreQueries.postMuteDocRefFromPostRef(postRef, activeUid)
  //         .delete();

  // Future<void> createUserMute(
  //         String passiveUid, String activeUid, SDMap json) async =>
  //     await FirestoreQueries.userMuteDocRef(passiveUid, activeUid).set(json);
  // Future<void> deleteUserMute(String passiveUid, String activeUid) async =>
  //     await FirestoreQueries.userMuteDocRef(passiveUid, activeUid).delete();

  // Future<void> createToken(
  //         String currentUid, String tokenId, SDMap json) async =>
  //     await FirestoreQueries.tokenQuery(currentUid, tokenId).set(json);
  // Future<void> deleteToken(String currentUid, String tokenId) async =>
  //     await FirestoreQueries.tokenQuery(currentUid, tokenId).delete();

  Future<void> createDoc(DocRef ref, SDMap json) async => await ref.set(json);
  Future<void> updateDoc(DocRef ref, SDMap json) async =>
      await ref.update(json);
  Future<void> deleteDoc(DocRef ref) async => await ref.delete();

  // Future<void> deleteUser(String uid) async =>
  //     await FirestoreQueries.userDocRef(uid).delete();
  // read
  // FutureDoc getBookmark(DocRef ref) async => await ref.get();
  // FutureDoc getPost(String uid, String postId) async =>
  //     await FirestoreQueries.userPostRef(uid, postId).get();

  // FutureQSnapshot getPosts(MapQuery query) async => await query.get();

  // FutureQSnapshot getTimelinePosts(List<String> timelinePostIds) async =>
  //     await FirestoreQueries.timelinePostsQuery(timelinePostIds).get();

  // FutureQSnapshot getTokens(String currentUid) async =>
  //     await FirestoreQueries.tokensQuery(currentUid).get();
  // FutureDoc getPublicUser(String uid) async =>
  //     await FirestoreQueries.userDocRef(uid).get();
  // FutureDoc getCurrentUser(String uid) async => getPublicUser(uid);
  // FutureDoc getPrivateUser(String uid) async =>
  //     await FirestoreQueries.privateUserDocRef(uid).get();

  // FutureQSnapshot getUsers(MapQuery query) async => await query.get();
  FutureDoc getDoc(DocRef ref) async => await ref.get();
  FutureQSnapshot getDocs(MapQuery query) async => await query.get();
}
