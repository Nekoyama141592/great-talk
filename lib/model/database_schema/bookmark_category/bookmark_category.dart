import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'bookmark_category.freezed.dart';
part 'bookmark_category.g.dart';

@freezed
abstract class BookmarkCategory with _$BookmarkCategory {
  const factory BookmarkCategory({
    required dynamic createdAt,
    required String id,
    required SDMap image,
    required String title,
    required dynamic ref,
    required dynamic updatedAt,
  }) = _BookmarkCategory;
  factory BookmarkCategory.fromJson(Map<String, dynamic> json) =>
      _$BookmarkCategoryFromJson(json);
}
