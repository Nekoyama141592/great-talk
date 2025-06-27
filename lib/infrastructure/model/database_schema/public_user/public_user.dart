import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/consts/msg_constants.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser with _$PublicUser {
  const PublicUser._();
  factory PublicUser({
    @Default("") String accountName,
    required Map<String, dynamic> bio,
    @Default(0) int blockCount,
    required dynamic createdAt,
    @Default("") String ethAddress,
    @Default(0) int followerCount,
    @Default(0) int followingCount,
    @Default(false) bool isNFTicon,
    @Default(false) bool isOfficial,
    @Default(false) bool isSuspended,
    @Default([]) List<Map<String, dynamic>> links,
    @Default(0) int muteCount,
    @Default(0) int postCount,
    @Default(0) int reportCount,
    @Default(0.0) double score,
    @Default({}) Map<String, dynamic> searchToken,
    required String uid,
    required dynamic updatedAt,
    required Map<String, dynamic> image,
    required Map<String, dynamic> userName,
    @Default([]) List<Map<String, dynamic>> walletAddresses,
  }) = _PublicUser;

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);
  factory PublicUser.fromRegister(
    String uid, {
    String? userName,
    String? bio,
    String? imageValue,
  }) {
    final now = FieldValue.serverTimestamp();
    return PublicUser(
      createdAt: now,
      bio:
          bio != null
              ? DetectedText(value: bio).toJson()
              : const DetectedText().toJson(),
      uid: uid,
      updatedAt: now,
      image:
          imageValue != null
              ? DetectedImage(value: imageValue).toJson()
              : DetectedImage().toJson(),
      userName:
          userName != null
              ? DetectedText(value: userName).toJson()
              : const DetectedText().toJson(),
    );
  }
  DetectedText typedBio() => DetectedText.fromJson(bio);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedImage typedImage() => DetectedImage.fromJson(image);
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;
  DetectedText typedUserName() => DetectedText.fromJson(userName);

  String get bioValue => typedBio().value;
  String get nameValue =>
      typedUserName().value.isEmpty
          ? MsgConstants.noName
          : typedUserName().value;
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
