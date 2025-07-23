import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_like_model.freezed.dart';
part 'post_like_model.g.dart';

@freezed
abstract class PostLikeModel with _$PostLikeModel {
  const PostLikeModel._();
  const factory PostLikeModel({
    required String activeUid,
    required dynamic createdAt,
    required String passiveUid,
    required String postId,
  }) = _PostLikeModel;
  factory PostLikeModel.fromJson(Map<String, dynamic> json) =>
      _$PostLikeModelFromJson(json);
  factory PostLikeModel.fromPost(
    String postId,
    String passiveUid,
    String currentUid,
  ) {
    return PostLikeModel(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      passiveUid: passiveUid,
      postId: postId,
    );
  }
}
