import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'mute_post_token.freezed.dart';
part 'mute_post_token.g.dart';

@freezed
abstract class MutePostToken with _$MutePostToken {
  const factory MutePostToken({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
    required String tokenId,
    required String tokenType,
  }) = _MutePostToken;
  factory MutePostToken.fromJson(Map<String, dynamic> json) =>
      _$MutePostTokenFromJson(json);
  factory MutePostToken.fromPost(String postId, String currentUid) {
    return MutePostToken(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      postId: postId,
      tokenId: IdUtil.randomString(),
      tokenType: TokenType.mutePost.name,
    );
  }
}
