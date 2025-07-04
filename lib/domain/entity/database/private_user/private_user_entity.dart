import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/private_user/private_user.dart';

part 'private_user_entity.freezed.dart';
part 'private_user_entity.g.dart';

@freezed
abstract class PrivateUserEntity with _$PrivateUserEntity {
  const PrivateUserEntity._();
  const factory PrivateUserEntity({@Default(false) bool isAdmin}) =
      _PrivateUserEntity;
  factory PrivateUserEntity.fromJson(Map<String, dynamic> json) =>
      _$PrivateUserEntityFromJson(json);

  factory PrivateUserEntity.fromModel(PrivateUser model) {
    return PrivateUserEntity(isAdmin: model.isAdmin);
  }
}
