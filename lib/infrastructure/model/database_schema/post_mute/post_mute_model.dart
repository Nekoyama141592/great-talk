import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_mute_model.freezed.dart';
part 'post_mute_model.g.dart';

@freezed
abstract class PostMute with _$PostMute {
  const factory PostMute({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
  }) = _PostMute;
  factory PostMute.fromJson(Map<String, dynamic> json) =>
      _$PostMuteFromJson(json);
  factory PostMute.fromPost(String postId, String currentUid) {
    return PostMute(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      postId: postId,
    );
  }
}
