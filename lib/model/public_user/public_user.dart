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
    required SDMap image,
    required SDMap userName,
    required List<SDMap> walletAddresses,
  }) = _PublicUser;

  factory PublicUser.fromJson(SDMap json) => _$PublicUserFromJson(json);
  DetectedText typedBio() => DetectedText.fromJson(bio);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedImage typedImage() => DetectedImage.fromJson(image);
  DocRef typedRef() => ref as DocRef;
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;
  DetectedText typedUserName() => DetectedText.fromJson(userName);

  bool isInappropriate() =>
      typedImage().moderationLabels.isNotEmpty ||
      typedBio().negativeScore > negativeLimit ||
      typedUserName().negativeScore > negativeLimit;
  String inappropriateReason(String currentUid) {
    String reason = "";
    final bioNS = typedBio().negativeScore;
    final userNameNS = typedUserName().negativeScore;
    final isMe = uid == currentUid;
    // 不適切なら理由を追加.
    if (typedImage().moderationLabels.isNotEmpty) {
      reason += "・写真が不適切です。\n";
      if (isMe) {
        String concatenatedNames =
            typedImage().typedMLs().map((ml) => ml.Name).join(', ');
        reason += "(理由: $concatenatedNames)\n";
      }
    }
    if (bioNS > negativeLimit) {
      reason += "・紹介文がネガティブです。\n";
      if (isMe) reason += "(ネガティブスコア: $bioNS)\n(紹介文: ${typedBio().value})\n";
    }
    if (userNameNS > negativeLimit) {
      reason += "・ユーザー名がネガティブです。\n";
      if (isMe) {
        reason +=
            "(ネガティブスコア: $userNameNS)\n(ユーザー名: ${typedUserName().value})\n";
      }
    }
    return reason;
  }
}
