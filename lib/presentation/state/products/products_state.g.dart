// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsState _$ProductsStateFromJson(Map<String, dynamic> json) =>
    _ProductsState(
      proProducts:
          (json['proProducts'] as List<dynamic>)
              .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
      premiumProducts:
          (json['premiumProducts'] as List<dynamic>)
              .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductsStateToJson(_ProductsState instance) =>
    <String, dynamic>{
      'proProducts': instance.proProducts,
      'premiumProducts': instance.premiumProducts,
    };
