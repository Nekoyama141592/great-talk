import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/database_schema/post/post.dart';

part 'post_mute.freezed.dart';
part 'post_mute.g.dart';

@freezed
abstract class PostMute with _$PostMute {
  const factory PostMute({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
  }) = _PostMute;
  factory PostMute.fromJson(Map<String, dynamic> json) =>
      _$PostMuteFromJson(json);
  factory PostMute.fromPost(Post post, String currentUid) {
    return PostMute(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      postId: post.postId,
    );
  }
}
