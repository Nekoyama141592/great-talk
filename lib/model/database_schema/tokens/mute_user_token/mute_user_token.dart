import 'package:freezed_annotation/freezed_annotation.dart';

part 'mute_user_token.freezed.dart';
part 'mute_user_token.g.dart';

@freezed
abstract class MuteUserToken with _$MuteUserToken {
  const factory MuteUserToken({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required dynamic passiveUserRef,
    required String tokenId,
    required String tokenType,
  }) = _MuteUserToken;
  factory MuteUserToken.fromJson(Map<String, dynamic> json) =>
      _$MuteUserTokenFromJson(json);
}
