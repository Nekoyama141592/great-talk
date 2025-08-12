import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';

part 'image_user.freezed.dart';
part 'image_user.g.dart';

@freezed
abstract class ImageUser with _$ImageUser {
  const factory ImageUser({required PublicUserEntity? user}) = _ImageUser;
  factory ImageUser.fromJson(Map<String, dynamic> json) =>
      _$ImageUserFromJson(json);
}
