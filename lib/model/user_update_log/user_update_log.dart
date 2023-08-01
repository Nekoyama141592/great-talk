import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'user_update_log.freezed.dart';
part 'user_update_log.g.dart';

@freezed
abstract class UserUpdateLog implements _$UserUpdateLog {
  const factory UserUpdateLog({
    required dynamic logCreatedAt,
    required SDMap searchToken,
    required String stringBio,
    required String stringUserName,
    required String uid,
    required String userImageUrl,
    required dynamic userRef,
  }) = _UserUpdateLog;
  factory UserUpdateLog.fromJson(SDMap json) => _$UserUpdateLogFromJson(json);
}
