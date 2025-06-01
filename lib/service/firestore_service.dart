import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreService {
  static final _instance = FirebaseFirestore.instance;
  // DocRef
  static final DocRef publicV1 = _instance.collection('public').doc('v1');
  static final DocRef privateV1 = _instance.collection('private').doc('v1');
  static DocRef user(String uid) => usersColRef().doc(uid);
  static DocRef follower(String currentUid, String passiveUid) =>
      user(passiveUid).collection('followers').doc(currentUid);
  static DocRef privateUser(String currentUid) =>
      privateV1.collection('privateUsers').doc(currentUid);
  static DocRef postLike(DocRef postRef, String activeUid) =>
      postRef.collection('postLikes').doc(activeUid);
  static DocRef postReport(DocRef postRef, String currentUid) =>
      postRef.collection('postReports').doc(currentUid);
  static DocRef post(String uid, String postId) =>
    postsColRef(uid).doc(postId);
  static DocRef userUpdateLog(String uid) =>
      user(uid).collection('userUpdateLogs').doc();
  static DocRef postMute(DocRef postRef, String currentUid) =>
      postRef.collection('postMutes').doc(currentUid);
  static DocRef userMute(String uid, String currentUid) =>
      user(uid).collection('userMutes').doc(currentUid);
  static DocRef token(String currentUid, String tokenId) =>
      tokensColRef(currentUid).doc(tokenId);
  // ColRef
  static ColRef usersColRef() => FirestoreService.publicV1.collection('users');
  static ColRef postsColRef(String uid) => FirestoreService.user(uid).collection('posts');
  static ColRef tokensColRef(String currentUid) =>
      FirestoreService.privateUser(currentUid).collection("tokens");
  static ColRef timelinesColRef(DocRef userRef) => userRef.collection('timelines');
  // Query
  // 基本
  static MapQuery usersQuery() => usersColRef().limit(oneTimeReadCount);
  static MapQuery userPostsQuery(String uid) =>
      postsColRef(uid).limit(oneTimeReadCount);
  static MapQuery postsQuery() => postsCollectionGroup().limit(oneTimeReadCount);
  // カスタム
  static MapQuery postsByWhereIn(List<String> postIds) =>
      postsQuery().where('postId', whereIn: postIds);
  static MapQuery userPostsByNewest(String uid) =>
      userPostsQuery(uid).orderBy("createdAt", descending: true);
  static MapQuery postsByMsgCount() =>
      postsQuery().orderBy('msgCount', descending: true);
  static MapQuery postsByNewest() =>
      postsQuery().orderBy('createdAt', descending: true);
  static MapQuery timelinesQuery(String  uid) => timelinesColRef(
    FirestoreService.user(uid),
  ).orderBy('createdAt', descending: true).limit(whereInLimit);
  static MapQuery timelinePostsQuery(List<String> timelinePostIds) =>
      postsQuery().where('postId', whereIn: timelinePostIds);
  static MapQuery usersByWhereIn(List<String> uids) =>
      usersQuery().where('uid', whereIn: uids);

  static MapQuery usersByFollowerCount() =>
      usersQuery().orderBy('followerCount', descending: true);
  // CollectionGroup
  static MapQuery usersCollectionGroup() => _instance.collectionGroup('users');
  static MapQuery postsCollectionGroup() => _instance.collectionGroup('posts');
  // 全部消す.
  static MapQuery messagesCollectionGroup() => _instance.collectionGroup('messages');
}
