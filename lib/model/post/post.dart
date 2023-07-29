import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post implements _$Post {
  const Post._();
  const factory Post({
    required dynamic createdAt,
    required SDMap description,
    required List<SDMap> exampleTexts,
    required String genre,
    required List<String> hashTags,
    required SDMap iconImage,
    required int impressionCount,
    required int likeCount,
    required List<SDMap> links,
    required int msgCount,
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
  DocRef typedRef() => ref as DocRef;
  Timestamp typedUpdatedAtAt() => createdAt as Timestamp;
}
