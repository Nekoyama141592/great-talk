// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_category_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookmarkCategoryToken _$$_BookmarkCategoryTokenFromJson(
        Map<String, dynamic> json) =>
    _$_BookmarkCategoryToken(
      createdAt: json['createdAt'],
      categoryName: json['categoryName'] as String,
      categoryId: json['categoryId'] as String,
      image: json['image'] as Map<String, dynamic>,
      ref: json['ref'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_BookmarkCategoryTokenToJson(
        _$_BookmarkCategoryToken instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'image': instance.image,
      'ref': instance.ref,
      'updatedAt': instance.updatedAt,
    };
