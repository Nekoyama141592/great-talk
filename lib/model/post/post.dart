import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/original_user/original_user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required dynamic createdAt,
    required String description,
    required String descriptionLanguageCode,
    required double descriptionNegativeScore,
    required List<Map<String, dynamic>> exampleTexts, // TODO: クラスにしろ
    required String genre,
    required List<String> hashTags,
    required int impressionCount,
    required int likeCount,
    required List<Map<String, dynamic>> links, // TODO: クラスにしろ,
    required int msgCount,
    required OriginalUser poster,
    required String postId,
    required int reportCount,
    required double score,
    required Map<String, dynamic> searchToken,
    required String title,
    required String titleLanguageCode,
    required double titleNegativeScore,
    required dynamic updatedAt,
    required int userCount,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
