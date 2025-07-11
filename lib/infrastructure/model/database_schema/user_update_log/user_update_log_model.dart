import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/util/search_util.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';

part 'user_update_log_model.freezed.dart';
part 'user_update_log_model.g.dart';

@freezed
abstract class UserUpdateLog with _$UserUpdateLog {
  const factory UserUpdateLog({
    required dynamic logCreatedAt,
    required Map<String, dynamic> searchToken,
    required String stringBio,
    required String stringUserName,
    required String uid,
    required Map<String, dynamic> image,
  }) = _UserUpdateLog;
  factory UserUpdateLog.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateLogFromJson(json);
  factory UserUpdateLog.fromRegister(
    String uid,
    String userName,
    String bio,
    String fileName,
  ) {
    return UserUpdateLog(
      logCreatedAt: FieldValue.serverTimestamp(),
      searchToken: SearchUtil.returnSearchToken(userName),
      stringBio: bio.trim(),
      stringUserName: userName.trim(),
      uid: uid,
      image: DetectedImage(value: fileName).toJson(),
    );
  }
}
