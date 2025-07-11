import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/util/search_util.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  const PostModel._();
  const factory PostModel({
    @Default(0) int bookmarkCount,
    required dynamic createdAt,
    required Map<String, dynamic> customCompleteText,
    required Map<String, dynamic> description,
    @Default([]) List<Map<String, dynamic>> exampleTexts,
    @Default("") String genre,
    @Default([]) List<String> hashTags,
    required Map<String, dynamic> image,
    @Default(0) int impressionCount,
    @Default(0) int likeCount,
    @Default([]) List<Map<String, dynamic>> links,
    @Default(0) int msgCount,
    @Default(0) int muteCount,
    required String postId,
    @Default(0) int reportCount,
    @Default(0.0) double score,
    required Map<String, dynamic> searchToken,
    required Map<String, dynamic> title,
    required String uid,
    required dynamic updatedAt,
    @Default(0) int userCount,
  }) = _PostModel;
  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
  factory PostModel.fromRegister(
    String systemPrompt,
    String title,
    String description,
    String fileName,
    String postId,
    Map<String, dynamic> customCompleteText,
    String uid,
  ) {
    final now = FieldValue.serverTimestamp();
    return PostModel(
      createdAt: now,
      customCompleteText: customCompleteText,
      description: DetectedText(value: description).toJson(),
      image: ModeratedImage(value: fileName).toJson(),
      postId: postId,
      searchToken: SearchUtil.returnSearchToken(title),
      title: DetectedText(value: title).toJson(),
      updatedAt: now,
      uid: uid,
    );
  }
}
