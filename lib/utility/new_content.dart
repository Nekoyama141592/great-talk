import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/maps.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/private_user/private_user.dart';
import 'package:great_talk/model/user_update_log/user_update_log.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class NewContent {
  static CustomCompleteText newCustomCompleteText(String systemPrompt) =>
      CustomCompleteText(systemPrompt: systemPrompt);
  static DetectedText newDetectedText(String value) => DetectedText(
      languageCode: "",
      negativeScore: 0.0,
      positiveScore: 0.0,
      sentiment: "",
      value: value);
  static DetectedImage newDetectedImage(String url) =>
      DetectedImage(moderationLabels: [], moderationModelVersion: "", url: url);
  static Post newPost(String systemPrompt, String title, PublicUser poster,
      String postId, DocRef postRef) {
    final now = Timestamp.now();
    return Post(
        createdAt: now,
        customCompleteText: newCustomCompleteText(systemPrompt).toJson(),
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

  static PublicUser newUser(String uid, {String? userName}) {
    final now = Timestamp.now();
    return PublicUser(
      accountName: "",
      createdAt: now,
      bio: newDetectedText("").toJson(),
      blockCount: 0,
      ethAddress: '',
      followerCount: 0,
      followingCount: 0,
      isNFTicon: false,
      isOfficial: false,
      isSuspended: false,
      muteCount: 0,
      postCount: 0,
      links: [],
      ref: FirestoreQueries.userDocRef(uid),
      reportCount: 0,
      score: 0,
      searchToken: {},
      uid: uid,
      updatedAt: now,
      userImage: newDetectedImage('').toJson(),
      userName: userName != null
          ? newDetectedText(userName).toJson()
          : newDetectedText('Unknown').toJson(),
      walletAddresses: [],
    );
  }

  static PrivateUser newPrivateUser(String uid) {
    final now = Timestamp.now();
    return PrivateUser(
        createdAt: now,
        ethAddress: '',
        gender: '',
        ipAddress: '',
        isAdmin: false,
        uid: uid,
        updatedAt: now);
  }

  static UserUpdateLog newUserUpdateLog(String stringBio, String stringUserName,
          String uid, String userImageUrl, DocRef userRef) =>
      UserUpdateLog(
          logCreatedAt: Timestamp.now(),
          searchToken: returnSearchToken(stringUserName),
          stringBio: stringBio,
          stringUserName: stringUserName,
          uid: uid,
          userImageUrl: userImageUrl,
          userRef: userRef);
}
