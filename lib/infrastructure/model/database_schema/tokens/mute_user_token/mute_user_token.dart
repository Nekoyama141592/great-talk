import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';

part 'mute_user_token.freezed.dart';
part 'mute_user_token.g.dart';

@freezed
abstract class MuteUserToken with _$MuteUserToken {
  const factory MuteUserToken({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,

    required String tokenId,
    required String tokenType,
  }) = _MuteUserToken;
  factory MuteUserToken.fromJson(Map<String, dynamic> json) =>
      _$MuteUserTokenFromJson(json);
  factory MuteUserToken.fromPost(String currentUid, Post post) {
    final passiveUid = post.uid;
    return MuteUserToken(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
      tokenId: IdUtil.randomString(),
      tokenType: TokenType.mutePost.name,
    );
  }
}
