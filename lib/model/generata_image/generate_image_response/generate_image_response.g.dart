// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenerateImageResponse _$$_GenerateImageResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GenerateImageResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GenerateImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GenerateImageResponseToJson(
        _$_GenerateImageResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
