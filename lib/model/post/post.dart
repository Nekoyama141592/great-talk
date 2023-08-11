import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post implements _$Post {
  const Post._();
  const factory Post({
    required int bookmarkCount,
    required dynamic createdAt,
    required SDMap customCompleteText,
    required SDMap description,
    required List<SDMap> exampleTexts,
    required String genre,
    required List<String> hashTags,
    required SDMap image,
    required int impressionCount,
    required int likeCount,
    required List<SDMap> links,
    required int msgCount,
    required int muteCount,
    required SDMap poster,
    required String postId,
    required dynamic ref,
    required int reportCount,
    required double score,
    required SDMap searchToken,
    required SDMap title,
    required dynamic updatedAt,
    required int userCount,
  }) = _Post;
  factory Post.fromJson(SDMap json) => _$PostFromJson(json);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedText typedDescription() => DetectedText.fromJson(description);
  DetectedImage typedImage() => DetectedImage.fromJson(image);
  PublicUser typedPoster() => PublicUser.fromJson(poster);
  DocRef typedRef() => ref as DocRef;
  DetectedText typedTitle() => DetectedText.fromJson(title);
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;
}
