import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'private_user_model.freezed.dart';
part 'private_user_model.g.dart';

@freezed
abstract class PrivateUserModel with _$PrivateUserModel {
  const PrivateUserModel._();
  const factory PrivateUserModel({
    @Default("") String? accessToken,
    required dynamic createdAt,
    @Default("") String ethAddress,
    @Default("") String? fcmToken,
    @Default("") String gender,
    @Default("") String ipAddress,
    @Default(false) bool isAdmin,
    required String uid,
    required dynamic updatedAt,
  }) = _PrivateUserModel;
  factory PrivateUserModel.fromJson(Map<String, dynamic> json) =>
      _$PrivateUserModelFromJson(json);
  factory PrivateUserModel.fromUid(String uid) {
    final now = FieldValue.serverTimestamp();
    return PrivateUserModel(
      accessToken: IdUtil.randomString(),
      createdAt: now,
      uid: uid,
      updatedAt: now,
    );
  }
}
