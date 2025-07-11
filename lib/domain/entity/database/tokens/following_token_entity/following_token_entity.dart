import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/following_token/following_token_model.dart';

part 'following_token_entity.freezed.dart';
part 'following_token_entity.g.dart';

@freezed
abstract class FollowingTokenEntity with _$FollowingTokenEntity {
  const FollowingTokenEntity._();
  const factory FollowingTokenEntity({
    required String passiveUid,
    required String tokenId,
  }) = _FollowingTokenEntity;

  factory FollowingTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$FollowingTokenEntityFromJson(json);

  factory FollowingTokenEntity.fromModel(FollowingToken model) {
    return FollowingTokenEntity(
      passiveUid: model.passiveUid,
      tokenId: model.tokenId,
    );
  }
}
