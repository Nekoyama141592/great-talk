import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/model/bookmark_category_token/bookmark_category_token.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreQueries {
  static final _instance = FirebaseFirestore.instance;
  static final DocRef _publicV1 = _instance.collection('public').doc('v1');
  static final DocRef _privateV1 = _instance.collection('private').doc('v1');
  // collectionGroup
  static final usersCollectionGroup = _instance.collectionGroup('users');
  static final postsCollectionGroup = _instance.collectionGroup('posts');
  static final _postsLimitedCollectionGroupQuery =
      postsCollectionGroup.limit(oneTimeReadCount);
  static final messagesCollectionGroup = _instance.collectionGroup('messages');
  static final searchLogsCollectionGroup =
      _instance.collectionGroup('searchLogs');
  // collection

  static DocRef followerQuery(String currentUid, String passiveUid) =>
      _usersColRef.doc(passiveUid).collection('followers').doc(currentUid);
  static DocRef postLikeDocRef(DocRef postRef, String activeUid) =>
      postRef.collection('postLikes').doc(activeUid);

  static MapQuery postsQueryByWhereIn(List<String> postIds) =>
      _postsLimitedCollectionGroupQuery.where('postId', whereIn: postIds);

  static DocRef postReportDocRefFromPostRef(
          DocRef postRef, String currentUid) =>
      postRef.collection('postReports').doc(currentUid);
  static DocRef postMuteDocRefFromPostRef(DocRef postRef, String currentUid) =>
      postRef.collection('postMutes').doc(currentUid);
  static DocRef userMuteDocRef(String uid, String currentUid) =>
      userDocRef(uid).collection('userMutes').doc(currentUid);

  static DocRef userPostRef(String uid, String postId) =>
      _userPostsColRef(uid).doc(postId);
  static ColRef _userPostsColRef(String uid) =>
      userDocRef(uid).collection('posts');
  static MapQuery userPostsQuery(String uid) =>
      _userPostsColRef(uid).limit(oneTimeReadCount);
  static MapQuery userPostsQueryByNewest(String uid) =>
      userPostsQuery(uid).orderBy("createdAt", descending: true);

  static final postsQueryByLikeCount =
      _postsLimitedCollectionGroupQuery.orderBy('likeCount', descending: true);
  static final postsQueryByNewest =
      _postsLimitedCollectionGroupQuery.orderBy('createdAt', descending: true);

  static ColRef postMessagesColRef(
          String posterUid, String postId, String currentUid) =>
      userPostRef(posterUid, postId)
          .collection('senders')
          .doc(currentUid)
          .collection('messages');
  static DocRef postMessageDocRef(String posterUid, String postId,
          String currentUid, String messageId) =>
      postMessagesColRef(posterUid, postId, currentUid).doc(messageId);

  static MapQuery timelinesQuery(DocRef userRef) => userRef
      .collection('timelines')
      .orderBy('createdAt', descending: true)
      .limit(whereInLimit);

  static MapQuery timelinePostsQuery(List<String> timelinePostIds) {
    if (timelinePostIds.isEmpty) {
      timelinePostIds.add('');
    }
    return _postsLimitedCollectionGroupQuery.where('postId',
        whereIn: timelinePostIds);
  }

  static DocRef tokenQuery(String currentUid, String tokenId) =>
      tokensQuery(currentUid).doc(tokenId);
  static ColRef tokensQuery(String currentUid) =>
      privateUserDocRef(currentUid).collection("tokens");
  static ColRef bookmarksQuery(BookmarkCategoryToken token) =>
      token.ref.collection('bookmarks');
  static DocRef bookmarkQuery(BookmarkCategoryToken token, String postId) =>
      bookmarksQuery(token).doc(postId);

  static DocRef userDocRef(String uid) => _usersColRef.doc(uid);
  static final ColRef _usersColRef = _publicV1.collection('users');
  static DocRef privateUserDocRef(String currentUid) =>
      _privateV1.collection('privateUsers').doc(currentUid);
  static DocRef searchLogDocRef(String currentUid) =>
      privateUserDocRef(currentUid)
          .collection('searchLogs')
          .doc(); // privateUserを作成してなくても作成できる

  static final usersQuery = _usersColRef.limit(oneTimeReadCount);

  static MapQuery usersQueryByWhereIn(List<String> uids) =>
      usersQuery.where('uid', whereIn: uids);

  static final usersQueryByFollowerCount =
      usersQuery.orderBy('followerCount', descending: true);

  static DocRef userUpdateLogDocRef(String uid) =>
      userDocRef(uid).collection('userUpdateLogs').doc();

  // 実際は使わない
  static DocRef originalContentDocRef(String contentId) =>
      _instance.collection('originalContents').doc(contentId);
}
