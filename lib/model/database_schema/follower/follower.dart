import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
abstract class Follower with _$Follower {
  const Follower._();
  const factory Follower({
    required dynamic activeUserRef,
    required dynamic createdAt,
    required dynamic passiveUserRef,
  }) = _Follower;
  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);

  Timestamp typedCreatedAt() => createdAt as Timestamp;
}
