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
      image: json['image'] as Map<String, dynamic>,
      ref: json['ref'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_BookmarkCategoryTokenToJson(
        _$_BookmarkCategoryToken instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'categoryName': instance.categoryName,
      'image': instance.image,
      'ref': instance.ref,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
      'updatedAt': instance.updatedAt,
    };
