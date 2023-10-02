import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'bookmark_category_token.freezed.dart';
part 'bookmark_category_token.g.dart';

@freezed
abstract class BookmarkCategoryToken with _$BookmarkCategoryToken {
  const factory BookmarkCategoryToken({
    required dynamic createdAt,
    required String categoryName,
    required String categoryId,
    required SDMap image,
    required dynamic ref,
    required dynamic updatedAt,
  }) = _BookmarkCategoryToken;
  factory BookmarkCategoryToken.fromJson(Map<String, dynamic> json) =>
      _$BookmarkCategoryTokenFromJson(json);
}
