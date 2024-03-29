import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/maps.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/private_user/private_user.dart';
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
    final pTemperature = temperature.trim().toRoundToSecondDecimalPlace();
    final pTopP = topP.trim().toRoundToSecondDecimalPlace();
    final pPresencePenalty =
        presencePenalty.trim().toRoundToSecondDecimalPlace();
    final pFrequencyPenalty =
        frequencyPenalty.trim().toRoundToSecondDecimalPlace();
    return CustomCompleteText(
      systemPrompt: systemPrompt,
      temperature:
          pTemperature != FormConsts.defaultTemperature ? pTemperature : null,
      topP: pTopP != FormConsts.defaultTopP ? pTopP : null,
      presencePenalty: pPresencePenalty != FormConsts.defaultPresencePenalty
          ? pPresencePenalty
          : null,
      frequencyPenalty: pFrequencyPenalty != FormConsts.defaultFrequencyPenalty
          ? pFrequencyPenalty
          : null,
    );
  }

  static DetectedImage newDetectedImage(String bucketName, String value) =>
      DetectedImage(bucketName: bucketName, value: value);
  static Post newPost(
      String systemPrompt,
      String title,
      String description,
      String fileName,
      String postId,
      DocRef postRef,
      SDMap customCompleteText,
      String uid) {
    final now = Timestamp.now();
    return Post(
        createdAt: now,
        customCompleteText: customCompleteText,
        description: DetectedText(value: description).toJson(),
        image: newDetectedImage(AWSS3Utility.bucketName, fileName).toJson(),
        postId: postId,
        ref: postRef,
        searchToken: returnSearchToken(title),
        title: DetectedText(value: title).toJson(),
        updatedAt: now,
        uid: uid);
  }

  static PublicUser newUser(String uid,
      {String? userName, String? bio, String? imageValue}) {
    final now = Timestamp.now();
    return PublicUser(
      createdAt: now,
      bio: bio != null
          ? DetectedText(value: bio).toJson()
          : const DetectedText().toJson(),
      ref: DocRefCore.user(uid),
      uid: uid,
      updatedAt: now,
      image: imageValue != null
          ? newDetectedImage(AWSS3Utility.bucketName, imageValue).toJson()
          : newDetectedImage(AWSS3Utility.bucketName, '').toJson(),
      userName: userName != null
          ? DetectedText(value: userName).toJson()
          : const DetectedText().toJson(),
    );
  }

  static PrivateUser newPrivateUser(String uid) {
    final now = Timestamp.now();
    return PrivateUser(
        createdAt: now,
        ref: DocRefCore.privateUser(uid),
        uid: uid,
        updatedAt: now);
  }
}
