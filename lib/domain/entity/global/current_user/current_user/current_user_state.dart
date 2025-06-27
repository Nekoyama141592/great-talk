import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database_schema/private_user/private_user.dart';
import 'package:great_talk/domain/entity/database_schema/public_user/public_user.dart';
part 'current_user_state.freezed.dart';
part 'current_user_state.g.dart';

@freezed
abstract class CurrentUserState with _$CurrentUserState {
  const CurrentUserState._();
  const factory CurrentUserState({
    PublicUser? publicUser,
    PrivateUser? privateUser,
    String? base64,
  }) = _CurrentUserState;
  factory CurrentUserState.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserStateFromJson(json);
  bool isAdmin() => privateUser?.isAdmin ?? false;
  bool isOfficial() => publicUser?.isOfficial ?? false;
}
