import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';

part 'public_user_model.freezed.dart';
part 'public_user_model.g.dart';

@freezed
abstract class PublicUserModel with _$PublicUserModel {
  const PublicUserModel._();
  factory PublicUserModel({
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
  }) = _PublicUserModel;

  factory PublicUserModel.fromJson(Map<String, dynamic> json) =>
      _$PublicUserModelFromJson(json);
  factory PublicUserModel.fromRegister(
    String uid, {
    String? userName,
    String? bio,
    String? imageValue,
  }) {
    final now = FieldValue.serverTimestamp();
    return PublicUserModel(
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
}
