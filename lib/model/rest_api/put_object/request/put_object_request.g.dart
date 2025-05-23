// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_object_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PutObjectRequest _$PutObjectRequestFromJson(Map<String, dynamic> json) =>
    _PutObjectRequest(
      base64Image: json['base64Image'] as String,
      object: json['object'] as String,
    );

Map<String, dynamic> _$PutObjectRequestToJson(_PutObjectRequest instance) =>
    <String, dynamic>{
      'base64Image': instance.base64Image,
      'object': instance.object,
    };
