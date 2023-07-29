import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
abstract class Follower implements _$Follower {
  const Follower._();
  const factory Follower({
    required dynamic createdAt,
    required String followedUid,
    required String followerUid,
  }) = _Follower;
  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);

  Timestamp typedCreatedAt() => createdAt as Timestamp;
}
