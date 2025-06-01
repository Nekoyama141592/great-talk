import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';

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
  factory Follower.fromUid(
    String currentUid,
    String passiveUid,
  ) {
    final now = FieldValue.serverTimestamp();
    return Follower(
      activeUserRef: DocRefCore.user(currentUid),
      createdAt: now,
      passiveUserRef: DocRefCore.user(passiveUid),
    );
  }
  Timestamp typedCreatedAt() => createdAt as Timestamp;
}
