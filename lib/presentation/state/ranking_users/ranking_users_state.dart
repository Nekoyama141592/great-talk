import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database_schema/public_user/public_user.dart';
import 'package:great_talk/presentation/state/common/image_user/image_user.dart';

part 'ranking_users_state.freezed.dart';
part 'ranking_users_state.g.dart';

@freezed
abstract class RankingUsersState with _$RankingUsersState {
  const RankingUsersState._();
  const factory RankingUsersState({required List<ImageUser> imageUsers}) =
      _ImageUser;
  factory RankingUsersState.fromJson(Map<String, dynamic> json) =>
      _$ImageUserFromJson(json);
  List<PublicUser> users() =>
      imageUsers.map((e) => e.user).whereType<PublicUser>().toList();
}
