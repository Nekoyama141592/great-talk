import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/post/post.dart';

part 'user_mute.freezed.dart';
part 'user_mute.g.dart';

@freezed
abstract class UserMute with _$UserMute {
  const factory UserMute({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
  }) = _UserMute;
  factory UserMute.fromJson(Map<String, dynamic> json) =>
      _$UserMuteFromJson(json);
  factory UserMute.fromPost(String currentUid, Post post) {
    final passiveUid = post.uid;
    return UserMute(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
    );
  }
}
