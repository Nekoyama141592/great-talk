import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/global/current_user/auth_user/auth_user.dart';

part 'current_user_state.freezed.dart';
part 'current_user_state.g.dart';


@freezed
abstract class CurrentUserState with _$CurrentUserState {
  const CurrentUserState._();
  const factory CurrentUserState({
    AuthUser? authUser,
    PublicUser? publicUser,
    PrivateUser? privateUser,
    String? base64,
  }) = _CurrentUserState;
  factory CurrentUserState.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserStateFromJson(json);
}
