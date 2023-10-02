import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'private_user.freezed.dart';
part 'private_user.g.dart';

@freezed
abstract class PrivateUser implements _$PrivateUser {
  const PrivateUser._();
  const factory PrivateUser({
    required dynamic createdAt,
    required String ethAddress,
    required String gender,
    required String ipAddress,
    required bool isAdmin,
    required dynamic ref,
    required String uid,
    required dynamic updatedAt,
  }) = _PrivateUser;
  factory PrivateUser.fromJson(Map<String, dynamic> json) =>
      _$PrivateUserFromJson(json);
  DocRef typedRef() => ref as DocRef;
}
