import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
abstract class Bookmark with _$Bookmark {
  const factory Bookmark({
    required String activeUid,
    required String categoryId,
    required dynamic createdAt,
    required String passiveUid,
    required dynamic postRef,
    required String postId,
    required dynamic ref,
  }) = _Bookmark;
  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}
