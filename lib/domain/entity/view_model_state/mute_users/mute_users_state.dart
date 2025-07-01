import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/domain/entity/view_model_state/common/image_user/image_user.dart';

part 'mute_users_state.freezed.dart';
part 'mute_users_state.g.dart';

@freezed
abstract class MuteUsersState with _$MuteUsersState {
  const MuteUsersState._();
  const factory MuteUsersState({required List<ImageUser> imageUsers}) =
      _MuteUsersState;
  factory MuteUsersState.fromJson(Map<String, dynamic> json) =>
      _$MuteUsersStateFromJson(json);
  List<PublicUserEntity> users() =>
      imageUsers.map((e) => e.user).whereType<PublicUserEntity>().toList();
}
