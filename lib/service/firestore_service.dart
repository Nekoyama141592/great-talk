import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/typedef/firestore_typedef.dart';

class FirestoreService {
  FirestoreService(this.instance);
  final FirebaseFirestore instance;
  WriteBatch batch() => instance.batch();
  // DocRef
  DocRef get publicV1 => instance.collection('public').doc('v1');
  DocRef get privateV1 => instance.collection('private').doc('v1');
  DocRef user(String uid) => usersColRef().doc(uid);
  DocRef follower(String currentUid, String passiveUid) =>
      user(passiveUid).collection('followers').doc(currentUid);
  DocRef privateUser(String currentUid) =>
      privateV1.collection('privateUsers').doc(currentUid);
  DocRef postLike(DocRef postRef, String activeUid) =>
      postRef.collection('postLikes').doc(activeUid);
  DocRef postReport(DocRef postRef, String currentUid) =>
      postRef.collection('postReports').doc(currentUid);
  DocRef post(String uid, String postId) =>
    postsColRef(uid).doc(postId);
  DocRef userUpdateLog(String uid) =>
      user(uid).collection('userUpdateLogs').doc();
  DocRef postMute(DocRef postRef, String currentUid) =>
      postRef.collection('postMutes').doc(currentUid);
  DocRef userMute(String uid, String currentUid) =>
      user(uid).collection('userMutes').doc(currentUid);
  DocRef token(String currentUid, String tokenId) =>
      tokensColRef(currentUid).doc(tokenId);
  // ColRef
  ColRef usersColRef() => publicV1.collection('users');
  ColRef postsColRef(String uid) => user(uid).collection('posts');
  ColRef tokensColRef(String currentUid) =>
      privateUser(currentUid).collection("tokens");
  ColRef timelinesColRef(DocRef userRef) => userRef.collection('timelines');
  // Query
  // 基本
  MapQuery usersQuery() => usersColRef().limit(oneTimeReadCount);
  MapQuery userPostsQuery(String uid) =>
      postsColRef(uid).limit(oneTimeReadCount);
  MapQuery postsQuery() => postsCollectionGroup().limit(oneTimeReadCount);
  // カスタム
  MapQuery postsByWhereIn(List<String> postIds) =>
      postsQuery().where('postId', whereIn: postIds);
  MapQuery userPostsByNewest(String uid) =>
      userPostsQuery(uid).orderBy("createdAt", descending: true);
  MapQuery postsByMsgCount() =>
      postsQuery().orderBy('msgCount', descending: true);
  MapQuery postsByNewest() =>
      postsQuery().orderBy('createdAt', descending: true);
  MapQuery timelinesQuery(String  uid) => timelinesColRef(
    user(uid),
  ).orderBy('createdAt', descending: true).limit(whereInLimit);
  MapQuery timelinePostsQuery(List<String> timelinePostIds) =>
      postsQuery().where('postId', whereIn: timelinePostIds);
  MapQuery usersByWhereIn(List<String> uids) =>
      usersQuery().where('uid', whereIn: uids);

  MapQuery usersByFollowerCount() =>
      usersQuery().orderBy('followerCount', descending: true);
  // CollectionGroup
  MapQuery usersCollectionGroup() => instance.collectionGroup('users');
  MapQuery postsCollectionGroup() => instance.collectionGroup('posts');
  // 全部消す.
  MapQuery messagesCollectionGroup() => instance.collectionGroup('messages');
}
