import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'following_token.freezed.dart';
part 'following_token.g.dart';

@freezed
abstract class FollowingToken with _$FollowingToken {
  const FollowingToken._();
  const factory FollowingToken({
    required dynamic createdAt,
    required String passiveUid,
    required dynamic passiveUserRef,
    required String tokenId,
    required String tokenType,
  }) = _FollowingToken;
  factory FollowingToken.fromJson(Map<String, dynamic> json) =>
      _$FollowingTokenFromJson(json);

  Timestamp typedCreatedAt() => createdAt as Timestamp;
}
