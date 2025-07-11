import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'mute_post_token_model.freezed.dart';
part 'mute_post_token_model.g.dart';

@freezed
abstract class MutePostTokenModel with _$MutePostTokenModel {
  const factory MutePostTokenModel({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
    required String tokenId,
    required String tokenType,
  }) = _MutePostTokenModel;
  factory MutePostTokenModel.fromJson(Map<String, dynamic> json) =>
      _$MutePostTokenModelFromJson(json);
  factory MutePostTokenModel.fromPost(String postId, String currentUid) {
    return MutePostTokenModel(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      postId: postId,
      tokenId: IdUtil.randomString(),
      tokenType: TokenType.mutePost.name,
    );
  }
}
