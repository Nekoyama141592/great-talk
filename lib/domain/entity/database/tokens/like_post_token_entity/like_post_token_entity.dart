import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/like_post_token/like_post_token_model.dart';

part 'like_post_token_entity.freezed.dart';
part 'like_post_token_entity.g.dart';

@freezed
abstract class LikePostTokenEntity with _$LikePostTokenEntity {
  const LikePostTokenEntity._();
  const factory LikePostTokenEntity({
    required String activeUid,
    required String passiveUid,
    required String postId,
    required String tokenId,
  }) = _LikePostTokenEntity;

  factory LikePostTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$LikePostTokenEntityFromJson(json);

  factory LikePostTokenEntity.fromModel(LikePostToken model) {
    return LikePostTokenEntity(
      activeUid: model.activeUid,
      passiveUid: model.passiveUid,
      postId: model.postId,
      tokenId: model.tokenId,
    );
  }
}
