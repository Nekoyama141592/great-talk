import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_update_log.freezed.dart';
part 'user_update_log.g.dart';

@freezed
abstract class UserUpdateLog with _$UserUpdateLog {
  const factory UserUpdateLog({
    required dynamic logCreatedAt,
    required Map<String,dynamic> searchToken,
    required String stringBio,
    required String stringUserName,
    required String uid,
    required Map<String,dynamic> image,
    required dynamic userRef,
  }) = _UserUpdateLog;
  factory UserUpdateLog.fromJson(Map<String,dynamic> json) => _$UserUpdateLogFromJson(json);
}
