import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/id_core.dart';
import 'package:great_talk/model/database_schema/post/post.dart';

part 'mute_post_token.freezed.dart';
part 'mute_post_token.g.dart';

@freezed
abstract class MutePostToken with _$MutePostToken {
  const factory MutePostToken({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
    // required dynamic postRef, // TODO: 対応
    required String tokenId,
    required String tokenType,
  }) = _MutePostToken;
  factory MutePostToken.fromJson(Map<String, dynamic> json) =>
      _$MutePostTokenFromJson(json);
  factory MutePostToken.fromPost(Post post, String currentUid) {
    return MutePostToken(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      // postRef: post.typedRef(),
      postId: post.postId,
      tokenId: IdCore.randomString(),
      tokenType: TokenType.mutePost.name,
    );
  }
}
