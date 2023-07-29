import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreQueries {
  static MapQuery newQuery(MapQuery query, Doc firstDoc) =>
      query.endAtDocument(firstDoc);
  static MapQuery moreQuery(MapQuery query, Doc lastDoc) =>
      query.startAtDocument(lastDoc);

  static final postsQuery = FirebaseFirestore.instance
      .collectionGroup('posts')
      .limit(oneTimeReadCount);

  static MapQuery postsQueryByFollowing(List<String> followingUids) {
    if (followingUids.isEmpty) {
      followingUids.add("");
    }
    return postsQuery
        .where('poster.uid', whereIn: followingUids)
        .orderBy('createdAt', descending: true);
  }

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

  static final usersQuery =
      FirebaseFirestore.instance.collection('users').limit(oneTimeReadCount);

  static final usersQueryByLikeCount =
      usersQuery.orderBy('followerCount', descending: true);
  static MapQuery moreUsersQueryByLikeCount(Doc lastDoc) =>
      moreQuery(usersQueryByLikeCount, lastDoc);
}
