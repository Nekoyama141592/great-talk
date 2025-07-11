import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_user_token/mute_user_token_model.dart';

part 'mute_user_token_entity.freezed.dart';
part 'mute_user_token_entity.g.dart';

@freezed
abstract class MuteUserTokenEntity with _$MuteUserTokenEntity {
  const MuteUserTokenEntity._();
  const factory MuteUserTokenEntity({
    required String activeUid,
    required String passiveUid,
    required String tokenId,
  }) = _MuteUserTokenEntity;

  factory MuteUserTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$MuteUserTokenEntityFromJson(json);

  factory MuteUserTokenEntity.fromModel(MuteUserTokenModel model) {
    return MuteUserTokenEntity(
      activeUid: model.activeUid,
      passiveUid: model.passiveUid,
      tokenId: model.tokenId,
    );
  }
}
