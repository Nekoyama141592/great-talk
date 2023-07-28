import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/original_user/original_user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required dynamic createdAt,
    required DetectedText description,
    required List<Map<String, dynamic>> exampleTexts, // TODO: クラスにしろ
    required String genre,
    required List<String> hashTags,
    required DetectedImage iconImage,
    required int impressionCount,
    required int likeCount,
    required List<Map<String, dynamic>> links, // TODO: クラスにしろ,
    required int msgCount,
    required OriginalUser poster,
    required String postId,
    required int reportCount,
    required double score,
    required Map<String, dynamic> searchToken,
    required DetectedText title,
    required dynamic updatedAt,
    required int userCount,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
