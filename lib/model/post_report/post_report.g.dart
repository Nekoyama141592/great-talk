// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostReport _$$_PostReportFromJson(Map<String, dynamic> json) =>
    _$_PostReport(
      activeUid: json['activeUid'] as String,
      activeUserRef: json['activeUserRef'],
      createdAt: json['createdAt'],
      others: json['others'] as String,
      postRef: json['postRef'],
      reportContents: (json['reportContents'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostReportToJson(_$_PostReport instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'activeUserRef': instance.activeUserRef,
      'createdAt': instance.createdAt,
      'others': instance.others,
      'postRef': instance.postRef,
      'reportContents': instance.reportContents,
      'post': instance.post,
    };
