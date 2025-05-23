// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_post_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportPostToken _$ReportPostTokenFromJson(Map<String, dynamic> json) =>
    _ReportPostToken(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      postId: json['postId'] as String,
      postRef: json['postRef'],
      tokenId: json['tokenId'] as String,
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$ReportPostTokenToJson(_ReportPostToken instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'postId': instance.postId,
      'postRef': instance.postRef,
      'tokenId': instance.tokenId,
      'tokenType': instance.tokenType,
    };
