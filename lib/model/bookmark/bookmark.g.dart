// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkImpl _$$BookmarkImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkImpl(
      activeUid: json['activeUid'] as String,
      categoryId: json['categoryId'] as String,
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      postRef: json['postRef'],
      postId: json['postId'] as String,
      ref: json['ref'],
    );

Map<String, dynamic> _$$BookmarkImplToJson(_$BookmarkImpl instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt,
      'passiveUid': instance.passiveUid,
      'postRef': instance.postRef,
      'postId': instance.postId,
      'ref': instance.ref,
    };
