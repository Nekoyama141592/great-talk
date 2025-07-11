import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'following_token_model.freezed.dart';
part 'following_token_model.g.dart';

@freezed
abstract class FollowingTokenModel with _$FollowingTokenModel {
  const FollowingTokenModel._();
  const factory FollowingTokenModel({
    required dynamic createdAt,
    required String passiveUid,
    required String tokenId,
    required String tokenType,
  }) = _FollowingTokenModel;
  factory FollowingTokenModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingTokenModelFromJson(json);
  factory FollowingTokenModel.fromUid(String passiveUid) {
    final tokenId = IdUtil.randomString();
    final now = FieldValue.serverTimestamp();
    return FollowingTokenModel(
      createdAt: now,
      passiveUid: passiveUid,
      tokenId: tokenId,
      tokenType: TokenType.following.name,
    );
  }
}
