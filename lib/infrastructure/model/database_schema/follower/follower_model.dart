import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower_model.freezed.dart';
part 'follower_model.g.dart';

@freezed
abstract class FollowerModel with _$FollowerModel {
  const FollowerModel._();
  const factory FollowerModel({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
  }) = _FollowerModel;
  factory FollowerModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerModelFromJson(json);
  factory FollowerModel.fromUid(String currentUid, String passiveUid) {
    final now = FieldValue.serverTimestamp();
    return FollowerModel(
      activeUid: currentUid,
      createdAt: now,
      passiveUid: passiveUid,
    );
  }
}
