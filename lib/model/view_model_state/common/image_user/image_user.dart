import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';

part 'image_user.freezed.dart';
part 'image_user.g.dart';

@freezed
abstract class ImageUser with _$ImageUser {
  const factory ImageUser({
    required PublicUser? user,
    required String? base64
  }) = _ImageUser;
  factory ImageUser.fromJson(Map<String, dynamic> json) =>
      _$ImageUserFromJson(json);
}
