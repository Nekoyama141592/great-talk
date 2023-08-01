import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_post_token.freezed.dart';
part 'like_post_token.g.dart';

@freezed
abstract class LikePostToken implements _$LikePostToken {
  const factory LikePostToken({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required dynamic postRef,
    required String postId,
    required String tokenId,
    required String tokenType,
  }) = _LikePostToken;
  factory LikePostToken.fromJson(Map<String, dynamic> json) =>
      _$LikePostTokenFromJson(json);
}
