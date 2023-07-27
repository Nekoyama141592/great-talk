import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  FutureQSnapshot getPostsByLikeCount() async =>
      await FirestoreQueries.postsQueryByLikeCount.get();
  FutureQSnapshot getMorePostsByLikeCount(Doc moreDoc) async =>
      await FirestoreQueries.morePostsQueryByLikeCount(moreDoc).get();

  FutureQSnapshot getTimelinePosts(List<String> timelinePostIds) async =>
      await FirestoreQueries.timelinePostsQuery(timelinePostIds).get();
  FutureQSnapshot getNewTimelinePosts(
          List<String> timelinePostIds, Doc newDoc) async =>
      await FirestoreQueries.newTimelinePostsQuery(timelinePostIds, newDoc)
          .get();
  FutureQSnapshot getMoreTimelinePosts(
          List<String> timelinePostIds, Doc moreDoc) async =>
      await FirestoreQueries.moreTimelinePostsQuery(timelinePostIds, moreDoc)
          .get();

  FutureQSnapshot getTimelines(DocRef userRef) async =>
      await FirestoreQueries.timelinesQuery(userRef).get();
  FutureQSnapshot getNewTimelines(DocRef userRef, Doc newDoc) async =>
      await FirestoreQueries.newTimelinesQuery(userRef, newDoc).get();
  FutureQSnapshot getMoreTimelines(DocRef userRef, Doc moreDoc) async =>
      await FirestoreQueries.moreTimelinesQuery(userRef, moreDoc).get();

  FutureQSnapshot getUsersByFollowerCount() async =>
      await FirestoreQueries.usersQueryByLikeCount.get();
  FutureQSnapshot getMoreUsersByFollowerCount(Doc moreDoc) async =>
      await FirestoreQueries.moreUsersQueryByLikeCount(moreDoc).get();
}
