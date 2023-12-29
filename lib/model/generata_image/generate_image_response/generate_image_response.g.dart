// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateImageResponseImpl _$$GenerateImageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateImageResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GenerateImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenerateImageResponseImplToJson(
        _$GenerateImageResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
