import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post implements _$Post {
  const Post._();
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
    required FirestoreUser poster,
    required String postId,
    required dynamic ref,
    required int reportCount,
    required double score,
    required Map<String, dynamic> searchToken,
    required DetectedText title,
    required dynamic updatedAt,
    required int userCount,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DocRef typedRef() => ref as DocRef;
  Timestamp typedUpdatedAtAt() => createdAt as Timestamp;
}
