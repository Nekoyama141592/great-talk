// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bookmark _$$_BookmarkFromJson(Map<String, dynamic> json) => _$_Bookmark(
      activeUid: json['activeUid'] as String,
      ref: json['ref'],
      categoryId: json['categoryId'] as String,
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      postRef: json['postRef'],
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$$_BookmarkToJson(_$_Bookmark instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'ref': instance.ref,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt,
      'passiveUid': instance.passiveUid,
      'postRef': instance.postRef,
      'postId': instance.postId,
    };
