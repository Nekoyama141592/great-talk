import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser implements _$PublicUser {
  const PublicUser._();
  factory PublicUser({
    required String accountName,
    required SDMap bio,
    required int blockCount,
    required dynamic createdAt,
    required String ethAddress,
    required int followerCount,
    required int followingCount,
    required bool isNFTicon,
    required bool isOfficial,
    required bool isSuspended,
    required List<SDMap> links,
    required int muteCount,
    required int postCount,
    required dynamic ref,
    required int reportCount,
    required double score,
    required SDMap searchToken,
    required String uid,
    required dynamic updatedAt,
    required SDMap userImage,
    required SDMap userName,
    required List<SDMap> walletAddresses,
  }) = _PublicUser;

  factory PublicUser.fromJson(SDMap json) => _$PublicUserFromJson(json);
  DetectedText typedBio() => DetectedText.fromJson(bio);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DocRef typedRef() => ref as DocRef;
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;
  DetectedImage typedUserImage() => DetectedImage.fromJson(userImage);
  DetectedText typedUserName() => DetectedText.fromJson(userName);

  bool isInappropriate() =>
      typedUserImage().moderationLabels.isNotEmpty ||
      typedBio().negativeScore > negativeLimit ||
      typedUserName().negativeScore > negativeLimit;
  String inappropriateReason() {
    String reason = "";
    if (typedUserImage().moderationLabels.isNotEmpty) {
      reason += "・写真が不適切です。\n";
    }
    if (typedBio().negativeScore > negativeLimit) {
      reason += "・紹介文がネガティブです。\n";
    }
    if (typedUserName().negativeScore > negativeLimit) {
      reason += "・ユーザー名がネガティブです。\n";
    }
    return reason;
  }
}
