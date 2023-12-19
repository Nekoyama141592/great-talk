// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookmarkCategory _$$_BookmarkCategoryFromJson(Map<String, dynamic> json) =>
    _$_BookmarkCategory(
      createdAt: json['createdAt'],
      id: json['id'] as String,
      image: json['image'] as Map<String, dynamic>,
      title: json['title'] as String,
      ref: json['ref'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_BookmarkCategoryToJson(_$_BookmarkCategory instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'ref': instance.ref,
      'updatedAt': instance.updatedAt,
    };
