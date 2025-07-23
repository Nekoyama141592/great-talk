import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'like_post_token_model.freezed.dart';
part 'like_post_token_model.g.dart';

@freezed
abstract class LikePostTokenModel with _$LikePostTokenModel {
  const factory LikePostTokenModel({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required String postId,
    required String tokenId,
    required String tokenType,
  }) = _LikePostTokenModel;
  factory LikePostTokenModel.fromJson(Map<String, dynamic> json) =>
      _$LikePostTokenModelFromJson(json);
  factory LikePostTokenModel.fromPost(
    String postId,
    String passiveUid,
    String currentUid,
  ) {
    return LikePostTokenModel(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
      postId: postId,
      tokenId: IdUtil.randomString(),
      tokenType: TokenType.likePost.name,
    );
  }
}
