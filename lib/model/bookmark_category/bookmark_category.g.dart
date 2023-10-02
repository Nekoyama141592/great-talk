// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookmarkCategory _$$_BookmarkCategoryFromJson(Map<String, dynamic> json) =>
    _$_BookmarkCategory(
      createdAt: json['createdAt'],
      title: json['title'] as String,
      id: json['id'] as String,
      image: json['image'] as Map<String, dynamic>,
      ref: json['ref'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_BookmarkCategoryToJson(_$_BookmarkCategory instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'title': instance.title,
      'id': instance.id,
      'image': instance.image,
      'ref': instance.ref,
      'updatedAt': instance.updatedAt,
    };
