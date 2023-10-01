import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
abstract class Bookmark implements _$Bookmark {
  const factory Bookmark({
    required String activeUid,
    required dynamic ref,
    required String categoryId,
    required dynamic createdAt,
    required String passiveUid,
    required dynamic postRef,
    required String postId,
  }) = _Bookmark;
  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}
