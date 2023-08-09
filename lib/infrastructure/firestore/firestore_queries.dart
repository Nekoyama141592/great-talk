import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/lists.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreQueries {
  static final _instance = FirebaseFirestore.instance;
  static final DocRef _publicV1 = _instance.collection('public').doc('v1');
  static final DocRef _privateV1 = _instance.collection('private').doc('v1');

  static MapQuery newQuery(MapQuery query, Doc firstDoc) =>
      query.endAtDocument(firstDoc);
  static MapQuery moreQuery(MapQuery query, Doc lastDoc) =>
      query.startAtDocument(lastDoc);

  static DocRef followerQuery(String currentUid, String passiveUid) =>
      _usersColRef.doc(passiveUid).collection("followers").doc(currentUid);
  static DocRef postLikeDocRef(DocRef postRef, String activeUid) =>
      postRef.collection('postLikes').doc(activeUid);

  static DocRef postDocRef(String uid, String postId) =>
      _userPostsColRef(uid).doc(postId);

  static final postsQuery =
      _instance.collectionGroup('posts').limit(oneTimeReadCount);

  static MapQuery postsQueryByFollowing(List<String> followingUids) {
    if (followingUids.isEmpty) {
      followingUids.add("");
    }
    return postsQuery.where('poster.uid', whereIn: followingUids);
  }

  static MapQuery postsQueryByWhereIn(List<String> postIds) =>
      postsQuery.where('postId', whereIn: postIds);

  static DocRef postReportDocRefFromPostRef(DocRef postRef) =>
      postRef.collection('postReports').doc();
  static DocRef postMuteDocRefFromPostRef(DocRef postRef, String currentUid) =>
      postRef.collection('postMutes').doc(currentUid);
  static DocRef userMuteDocRef(String uid, String currentUid) =>
      userDocRef(uid).collection('userMutes').doc(currentUid);

  static DocRef userPostRef(String uid, String postId) =>
      _userPostsColRef(uid).doc(postId);
  static ColRef _userPostsColRef(String uid) =>
      userDocRef(uid).collection('public').doc('v1').collection('posts');
  static MapQuery userPostsQueryByNewest(String uid) =>
      _userPostsColRef(uid).orderBy("createdAt", descending: true);
  static MapQuery moreUserPostsQueryByNewest(String uid, Doc lastDoc) =>
      moreQuery(userPostsQueryByNewest(uid), lastDoc);
  static MapQuery newUserPostsQueryByNewest(String uid, Doc firstDoc) =>
      newQuery(userPostsQueryByNewest(uid), firstDoc);

  static MapQuery newPostsQueryByFollowing(
          List<String> followingUids, Doc firstDoc) =>
      newQuery(postsQueryByFollowing(followingUids), firstDoc);
  static MapQuery morePostsQueryByFollowing(
          List<String> followingUids, Doc lastDoc) =>
      moreQuery(postsQueryByFollowing(followingUids), lastDoc);

  static final postsQueryByLikeCount =
      postsQuery.orderBy('likeCount', descending: true);
  static MapQuery morePostsQueryByLikeCount(Doc lastDoc) =>
      moreQuery(postsQueryByLikeCount, lastDoc);

  static ColRef postMessagesColRef(String uid,String postId) => postDocRef(uid, postId).collection('messages');
  static DocRef postMessageDocRef(String uid,String postId,String messageId) => postDocRef(uid, postId).collection('messages').doc(messageId);

  static MapQuery timelinesQuery(DocRef userRef) => userRef
      .collection('timelines')
      .orderBy('createdAt', descending: true)
      .limit(whereInLimit);
  static MapQuery newTimelinesQuery(DocRef userRef, Doc firstDoc) =>
      newQuery(timelinesQuery(userRef), firstDoc);
  static MapQuery moreTimelinesQuery(DocRef userRef, Doc lastDoc) =>
      moreQuery(timelinesQuery(userRef), lastDoc);

  static MapQuery timelinePostsQuery(List<String> timelinePostIds) {
    if (timelinePostIds.isEmpty) {
      timelinePostIds.add('');
    }
    return postsQuery.where('postId', whereIn: timelinePostIds);
  }

  static MapQuery newTimelinePostsQuery(
          List<String> timelinePostIds, Doc firstDoc) =>
      newQuery(timelinePostsQuery(timelinePostIds), firstDoc);
  static MapQuery moreTimelinePostsQuery(
          List<String> timelinePostIds, Doc lastDoc) =>
      moreQuery(timelinePostsQuery(timelinePostIds), lastDoc);

  static DocRef tokenQuery(String currentUid, String tokenId) =>
      tokensQuery(currentUid).doc(tokenId);
  static ColRef tokensQuery(String currentUid) =>
      _usersColRef.doc(currentUid).collection("tokens");

  static DocRef userDocRef(String uid) => _usersColRef.doc(uid);
  static final ColRef _usersColRef = _publicV1.collection('users');
  static DocRef privateUserDocRef(String uid) =>
      _privateV1.collection('privateUsers').doc(uid);

  static final usersQuery = _usersColRef.limit(oneTimeReadCount);

  static MapQuery usersQueryByWhereIn(List<String> uids) =>
      usersQuery.where('uid', whereIn: uids);

  static final usersQueryByLikeCount =
      usersQuery.orderBy('followerCount', descending: true);
  static MapQuery moreUsersQueryByLikeCount(Doc lastDoc) =>
      moreQuery(usersQueryByLikeCount, lastDoc);
  static MapQuery userSearchQuery(String searchTerm) =>
      searchQuery(usersQuery, searchTerm);
  static MapQuery moreUserSearchQuery(String searchTerm, Doc lastDoc) =>
      moreQuery(userSearchQuery(searchTerm), lastDoc);
  static MapQuery userPostsSearchQuery(String uid, String searchTerm) =>
      searchQuery(_userPostsColRef(uid), searchTerm);
  static MapQuery moreUserPostsSearchQuery(
          String uid, String searchTerm, Doc lastDoc) =>
      moreQuery(searchQuery(_userPostsColRef(uid), searchTerm), lastDoc);

  static DocRef userUpdateLogDocRef(String uid) =>
      userDocRef(uid).collection('userUpdateLogs').doc();

  static MapQuery searchQuery(MapQuery query, String searchTerm) {
    final searchWords = returnSearchWords(searchTerm);
    MapQuery searchQuery = query;
    for (final searchWord in searchWords) {
      searchQuery =
          searchQuery.where("searchToken.$searchWord", isEqualTo: true);
    }
    return query;
  }
}
