import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'mute_user_token_model.freezed.dart';
part 'mute_user_token_model.g.dart';

@freezed
abstract class MuteUserTokenModel with _$MuteUserTokenModel {
  const factory MuteUserTokenModel({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,

    required String tokenId,
    required String tokenType,
  }) = _MuteUserTokenModel;
  factory MuteUserTokenModel.fromJson(Map<String, dynamic> json) =>
      _$MuteUserTokenModelFromJson(json);
  factory MuteUserTokenModel.fromPost(String currentUid, String passiveUid) {
    return MuteUserTokenModel(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
      tokenId: IdUtil.randomString(),
      tokenType: TokenType.muteUser.name,
    );
  }
}
