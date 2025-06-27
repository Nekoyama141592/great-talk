import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';

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
  factory PostLike.fromPost(Post post, String currentUid) {
    return PostLike(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: post.uid,
      // postRef: post.ref,
      postId: post.postId,
    );
  }
}
