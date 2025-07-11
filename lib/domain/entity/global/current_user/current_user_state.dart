import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/private_user/private_user_model.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
part 'current_user_state.freezed.dart';
part 'current_user_state.g.dart';

@freezed
abstract class CurrentUserState with _$CurrentUserState {
  const CurrentUserState._();
  const factory CurrentUserState({
    PublicUserEntity? publicUser,
    PrivateUserModel? privateUser,
    String? base64,
  }) = _CurrentUserState;
  factory CurrentUserState.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserStateFromJson(json);
  bool isAdmin() => privateUser?.isAdmin ?? false;
  bool isOfficial() => publicUser?.isOfficial ?? false;
}
