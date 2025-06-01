import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/service/firestore_service.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'private_user.freezed.dart';
part 'private_user.g.dart';

@freezed
abstract class PrivateUser with _$PrivateUser {
  const PrivateUser._();
  const factory PrivateUser({
    @Default("") String? accessToken,
    required dynamic createdAt,
    @Default("") String ethAddress,
    @Default("") String? fcmToken,
    @Default("") String gender,
    @Default("") String ipAddress,
    @Default(false) bool isAdmin,
    required dynamic ref,
    required String uid,
    required dynamic updatedAt,
  }) = _PrivateUser;
  factory PrivateUser.fromJson(Map<String, dynamic> json) =>
      _$PrivateUserFromJson(json);
  factory PrivateUser.fromUid(String uid)  {
    final now = FieldValue.serverTimestamp();
    return PrivateUser(
      accessToken: randomString(),
      createdAt: now,
      ref: FirestoreService.privateUser(uid),
      uid: uid,
      updatedAt: now,
    );
  }
  DocRef typedRef() => ref as DocRef;
}
