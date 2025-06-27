import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/id_core.dart';
import 'package:great_talk/domain/database_schema/post/post.dart';

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
  factory LikePostToken.fromPost(Post post, String currentUid) {
    return LikePostToken(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: post.uid,
      // postRef: post.typedRef(),
      postId: post.postId,
      tokenId: IdCore.randomString(),
      tokenType: TokenType.likePost.name,
    );
  }
}
