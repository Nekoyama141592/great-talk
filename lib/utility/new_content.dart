import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/maps.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/private_user/private_user.dart';
import 'package:great_talk/model/user_update_log/user_update_log.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';

class NewContent {
  static CustomCompleteText newCustomCompleteText(
      String systemPrompt,
      String temperature,
      String topP,
      String presencePenalty,
      String frequencyPenalty) {
    // doubleにparse
    final pTemperature = temperature.trim().toDouble();
    final pTopP = topP.trim().toDouble();
    final pPresencePenalty = presencePenalty.trim().toDouble();
    final pFrequencyPenalty = frequencyPenalty.trim().toDouble();
    return CustomCompleteText(
      systemPrompt: systemPrompt,
      temperature: pTemperature != defaultTemperature ? pTemperature : null,
      topP: pTopP != defaultTopP ? pTopP : null,
      presencePenalty:
          pPresencePenalty != defaultPresencePenalty ? pPresencePenalty : null,
      frequencyPenalty: pFrequencyPenalty != defaultFrequencyPenalty
          ? pFrequencyPenalty
          : null,
    );
  }

  static DetectedText newDetectedText(String value) => DetectedText(
      languageCode: "",
      negativeScore: 0.0,
      positiveScore: 0.0,
      sentiment: "",
      value: value);
  static DetectedImage newDetectedImage(String bucketName, String value) =>
      DetectedImage(
          bucketName: bucketName,
          moderationLabels: [],
          moderationModelVersion: "",
          value: value);
  static Post newPost(
      String systemPrompt,
      String title,
      String description,
      String fileName,
      PublicUser poster,
      String postId,
      DocRef postRef,
      SDMap customCompleteText) {
    final now = Timestamp.now();
    return Post(
        bookmarkCount: 0,
        createdAt: now,
        customCompleteText: customCompleteText,
        description: newDetectedText(description).toJson(),
        exampleTexts: [],
        genre: '',
        hashTags: [],
        image: newDetectedImage(AWSS3Utility.postImagesBucketName(), fileName)
            .toJson(),
        impressionCount: 0,
        likeCount: 0,
        links: [],
        msgCount: 0,
        muteCount: 0,
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

  static PublicUser newUser(String uid,
      {String? userName, String? bio, String? imageValue}) {
    final now = Timestamp.now();
    return PublicUser(
      accountName: "",
      createdAt: now,
      bio: bio != null
          ? newDetectedText(bio).toJson()
          : newDetectedText("").toJson(),
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
      image: imageValue != null
          ? newDetectedImage(AWSS3Utility.userImagesBucketName(), imageValue)
              .toJson()
          : newDetectedImage(AWSS3Utility.userImagesBucketName(), '').toJson(),
      userName: userName != null
          ? newDetectedText(userName).toJson()
          : newDetectedText('名無し').toJson(),
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
        purchasedPoints: 0,
        ref: FirestoreQueries.privateUserDocRef(uid),
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
          imageFileName: userImageUrl,
          userRef: userRef);
}
