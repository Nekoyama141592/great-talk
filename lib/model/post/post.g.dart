// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      createdAt: json['createdAt'],
      description: json['description'] as Map<String, dynamic>,
      exampleTexts: (json['exampleTexts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      genre: json['genre'] as String,
      hashTags:
          (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
      iconImage: json['iconImage'] as Map<String, dynamic>,
      impressionCount: json['impressionCount'] as int,
      likeCount: json['likeCount'] as int,
      links: (json['links'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      msgCount: json['msgCount'] as int,
      poster: json['poster'] as Map<String, dynamic>,
      postId: json['postId'] as String,
      ref: json['ref'],
      reportCount: json['reportCount'] as int,
      score: (json['score'] as num).toDouble(),
      searchToken: json['searchToken'] as Map<String, dynamic>,
      title: json['title'] as Map<String, dynamic>,
      updatedAt: json['updatedAt'],
      userCount: json['userCount'] as int,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'description': instance.description,
      'exampleTexts': instance.exampleTexts,
      'genre': instance.genre,
      'hashTags': instance.hashTags,
      'iconImage': instance.iconImage,
      'impressionCount': instance.impressionCount,
      'likeCount': instance.likeCount,
      'links': instance.links,
      'msgCount': instance.msgCount,
      'poster': instance.poster,
      'postId': instance.postId,
      'ref': instance.ref,
      'reportCount': instance.reportCount,
      'score': instance.score,
      'searchToken': instance.searchToken,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'userCount': instance.userCount,
    };
