import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/core/util/id_util.dart';

part 'following_token.freezed.dart';
part 'following_token.g.dart';

@freezed
abstract class FollowingToken with _$FollowingToken {
  const FollowingToken._();
  const factory FollowingToken({
    required dynamic createdAt,
    required String passiveUid,
    required String tokenId,
    required String tokenType,
  }) = _FollowingToken;
  factory FollowingToken.fromJson(Map<String, dynamic> json) =>
      _$FollowingTokenFromJson(json);
  factory FollowingToken.fromUid(String passiveUid) {
    final tokenId = IdUtil.randomString();
    final now = FieldValue.serverTimestamp();
    return FollowingToken(
      createdAt: now,
      passiveUid: passiveUid,
      tokenId: tokenId,
      tokenType: TokenType.following.name,
    );
  }
  Timestamp typedCreatedAt() => createdAt as Timestamp;
}
