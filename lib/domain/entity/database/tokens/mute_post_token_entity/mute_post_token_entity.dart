import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token.dart';

part 'mute_post_token_entity.freezed.dart';
part 'mute_post_token_entity.g.dart';

@freezed
abstract class MutePostTokenEntity with _$MutePostTokenEntity {
  const MutePostTokenEntity._();
  const factory MutePostTokenEntity({
    required String activeUid,
    required String postId,
    required String tokenId,
  }) = _MutePostTokenEntity;

  factory MutePostTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$MutePostTokenEntityFromJson(json);

  factory MutePostTokenEntity.fromModel(MutePostToken model) {
    return MutePostTokenEntity(
      activeUid: model.activeUid,
      postId: model.postId,
      tokenId: model.tokenId,
    );
  }
}
