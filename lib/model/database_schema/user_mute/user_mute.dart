import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/database_schema/post/post.dart';

part 'user_mute.freezed.dart';
part 'user_mute.g.dart';

@freezed
abstract class UserMute with _$UserMute {
  const factory UserMute({
    required String activeUid,
    required dynamic activeUserRef,
    required dynamic createdAt,
    required String passiveUid,
    required dynamic passiveUserRef,
  }) = _UserMute;
  factory UserMute.fromJson(Map<String, dynamic> json) =>
      _$UserMuteFromJson(json);
  factory UserMute.fromPost(String currentUid, Post post) {
    final passiveUid = post.uid;
    return UserMute(
      activeUid: currentUid,
      activeUserRef: DocRefCore.user(currentUid),
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
      passiveUserRef: DocRefCore.user(passiveUid),
    );
  }
}
