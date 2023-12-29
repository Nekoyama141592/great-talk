// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostReportImpl _$$PostReportImplFromJson(Map<String, dynamic> json) =>
    _$PostReportImpl(
      activeUid: json['activeUid'] as String,
      activeUserRef: json['activeUserRef'],
      createdAt: json['createdAt'],
      others: json['others'] as String,
      postRef: json['postRef'],
      reportContents: (json['reportContents'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PostReportImplToJson(_$PostReportImpl instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'activeUserRef': instance.activeUserRef,
      'createdAt': instance.createdAt,
      'others': instance.others,
      'postRef': instance.postRef,
      'reportContents': instance.reportContents,
    };
