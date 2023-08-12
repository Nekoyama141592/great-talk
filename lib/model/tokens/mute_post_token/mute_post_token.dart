import 'package:freezed_annotation/freezed_annotation.dart';

part 'mute_post_token.freezed.dart';
part 'mute_post_token.g.dart';

@freezed
abstract class MutePostToken implements _$MutePostToken {
  const factory MutePostToken({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
    required dynamic postRef,
    required String tokenId,
    required String tokenType,
  }) = _MutePostToken;
  factory MutePostToken.fromJson(Map<String, dynamic> json) =>
      _$MutePostTokenFromJson(json);
}
