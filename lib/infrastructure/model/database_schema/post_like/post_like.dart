import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_like.freezed.dart';
part 'post_like.g.dart';

@freezed
abstract class PostLike with _$PostLike {
  const factory PostLike({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required String postId,
  }) = _PostLike;
  factory PostLike.fromJson(Map<String, dynamic> json) =>
      _$PostLikeFromJson(json);
  factory PostLike.fromPost(
    String postId,
    String passiveUid,
    String currentUid,
  ) {
    return PostLike(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
      postId: postId,
    );
  }
}
