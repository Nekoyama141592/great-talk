// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateImageResponse _$GenerateImageResponseFromJson(
  Map<String, dynamic> json,
) => _GenerateImageResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : GenerateImageData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$GenerateImageResponseToJson(
  _GenerateImageResponse instance,
) => <String, dynamic>{'data': instance.data};
