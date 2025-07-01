// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseDetailsEntity _$PurchaseDetailsEntityFromJson(
  Map<String, dynamic> json,
) => _PurchaseDetailsEntity(
  productID: json['productID'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$PurchaseDetailsEntityToJson(
  _PurchaseDetailsEntity instance,
) => <String, dynamic>{
  'productID': instance.productID,
  'status': instance.status,
};
