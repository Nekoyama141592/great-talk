import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'like_post_token.freezed.dart';
part 'like_post_token.g.dart';

@freezed
abstract class LikePostToken with _$LikePostToken {
  const factory LikePostToken({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required String postId,
    required String tokenId,
    required String tokenType,
  }) = _LikePostToken;
  factory LikePostToken.fromJson(Map<String, dynamic> json) =>
      _$LikePostTokenFromJson(json);
  factory LikePostToken.fromPost(
    String postId,
    String passiveUid,
    String currentUid,
  ) {
    return LikePostToken(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
      postId: postId,
      tokenId: IdUtil.randomString(),
      tokenType: TokenType.likePost.name,
    );
  }
}
