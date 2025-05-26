import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser with _$PublicUser {
  const PublicUser._();
  factory PublicUser({
    @Default("") String accountName,
    required SDMap bio,
    @Default(0) int blockCount,
    required dynamic createdAt,
    @Default("") String ethAddress,
    @Default(0) int followerCount,
    @Default(0) int followingCount,
    @Default(false) bool isNFTicon,
    @Default(false) bool isOfficial,
    @Default(false) bool isSuspended,
    @Default([]) List<SDMap> links,
    @Default(0) int muteCount,
    @Default(0) int postCount,
    required dynamic ref,
    @Default(0) int reportCount,
    @Default(0.0) double score,
    @Default({}) SDMap searchToken,
    required String uid,
    required dynamic updatedAt,
    required SDMap image,
    required SDMap userName,
    @Default([]) List<SDMap> walletAddresses,
  }) = _PublicUser;

  factory PublicUser.fromJson(SDMap json) => _$PublicUserFromJson(json);
  DetectedText typedBio() => DetectedText.fromJson(bio);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedImage typedImage() => DetectedImage.fromJson(image);
  DocRef typedRef() => ref as DocRef;
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;
  DetectedText typedUserName() => DetectedText.fromJson(userName);

  String get bioValue => typedBio().value;
  String get nameValue =>
      typedUserName().value.isEmpty ? noName : typedUserName().value;
  bool get hasNoBio => bioValue.isEmpty;
  bool isInappropriate() =>
      typedImage().moderationLabels.isNotEmpty ||
      typedBio().negativeScore > negativeLimit ||
      typedUserName().negativeScore > negativeLimit;
  String inappropriateReason(String? currentUid) {
    String reason = "";
    final bioNS = typedBio().negativeScore;
    final userNameNS = typedUserName().negativeScore;
    final isMe = uid == currentUid;
    // 不適切なら理由を追加.
    if (typedImage().moderationLabels.isNotEmpty) {
      reason += "・写真が不適切です。\n";
      if (isMe) {
        String concatenatedNames = typedImage()
            .typedMLs()
            .map((ml) => ml.Name)
            .join(', ');
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
        reason += "(ネガティブスコア: $userNameNS)\n(ユーザー名: $nameValue)\n";
      }
    }
    return reason;
  }
}
