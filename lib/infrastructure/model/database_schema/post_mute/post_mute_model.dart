import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_mute_model.freezed.dart';
part 'post_mute_model.g.dart';

@freezed
abstract class PostMuteModel with _$PostMuteModel {
  const factory PostMuteModel({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
  }) = _PostMuteModel;
  factory PostMuteModel.fromJson(Map<String, dynamic> json) =>
      _$PostMuteModelFromJson(json);
  factory PostMuteModel.fromPost(String postId, String currentUid) {
    return PostMuteModel(
      activeUid: currentUid,
      createdAt: FieldValue.serverTimestamp(),
      postId: postId,
    );
  }
}
