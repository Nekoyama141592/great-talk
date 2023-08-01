import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/maps.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class NewContent {
  static DetectedText newDetectedText(String value) => DetectedText(
      languageCode: "",
      negativeScore: 0.0,
      positiveScore: 0.0,
      sentiment: "",
      value: value);
  static DetectedImage newDetectedImage(String url) =>
      DetectedImage(moderationLabels: [], moderationModelVersion: "", url: url);
  static Post newPost(
      String title, FirestoreUser poster, String postId, DocRef postRef) {
    final now = Timestamp.now();
    return Post(
        createdAt: now,
        description: newDetectedText("").toJson(),
        exampleTexts: [],
        genre: '',
        hashTags: [],
        iconImage: newDetectedImage('').toJson(),
        impressionCount: 0,
        likeCount: 40,
        links: [],
        msgCount: 0,
        poster: poster.toJson(),
        postId: postId,
        ref: postRef,
        reportCount: 0,
        score: 0.0,
        searchToken: returnSearchToken(title),
        title: newDetectedText(title).toJson(),
        updatedAt: now,
        userCount: 0);
  }

  static FirestoreUser newUser(String uid) {
    final now = Timestamp.now();
    return FirestoreUser(
      accountName: "",
      createdAt: now,
      bio: newDetectedText("").toJson(),
      blockCount: 0,
      ethAddress: '',
      followerCount: 0,
      followingCount: 0,
      isAdmin: false,
      isNFTicon: false,
      isOfficial: false,
      isSuspended: false,
      muteCount: 0,
      postCount: 0,
      links: [],
      nftIconInfo: {},
      ref: FirestoreQueries.userQuery(uid),
      reportCount: 0,
      score: 0,
      searchToken: {},
      uid: uid,
      updatedAt: now,
      userImage: newDetectedImage('').toJson(),
      userName: newDetectedText('Unknown').toJson(),
      walletAddresses: [],
    );
  }
}
