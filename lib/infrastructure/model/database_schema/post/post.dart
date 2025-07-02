import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/util/search_util.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const Post._();
  const factory Post({
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
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  factory Post.fromRegister(
    String systemPrompt,
    String title,
    String description,
    String fileName,
    String postId,
    Map<String, dynamic> customCompleteText,
    String uid,
  ) {
    final now = FieldValue.serverTimestamp();
    return Post(
      createdAt: now,
      customCompleteText: customCompleteText,
      description: DetectedText(value: description).toJson(),
      image: DetectedImage(value: fileName).toJson(),
      postId: postId,
      searchToken: SearchUtil.returnSearchToken(title),
      title: DetectedText(value: title).toJson(),
      updatedAt: now,
      uid: uid,
    );
  }
}
