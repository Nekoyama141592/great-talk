import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
abstract class Follower with _$Follower {
  const Follower._();
  const factory Follower({
    // required dynamic activeUserRef, // TODO: 対応
    required String activeUid, // TODO: 新規追加対応
    required dynamic createdAt,
    required String passiveUid, // TODO: 新規追加対応
    // required dynamic passiveUserRef, // TODO: 対応
  }) = _Follower;
  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);
  factory Follower.fromUid(
    String currentUid,
    String passiveUid,
  ) {
    final now = FieldValue.serverTimestamp();
    return Follower(
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid
    );
  }
  Timestamp typedCreatedAt() => createdAt as Timestamp;
}
