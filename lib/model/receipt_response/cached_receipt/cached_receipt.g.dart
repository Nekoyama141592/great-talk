// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CachedReceipt _$$_CachedReceiptFromJson(Map<String, dynamic> json) =>
    _$_CachedReceipt(
      expiryTimeMillis: json['expiryTimeMillis'] as String,
      orderId: json['orderId'] as String,
      productId: json['productId'] as String,
      startTimeMillis: json['startTimeMillis'] as String,
    );

Map<String, dynamic> _$$_CachedReceiptToJson(_$_CachedReceipt instance) =>
    <String, dynamic>{
      'expiryTimeMillis': instance.expiryTimeMillis,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'startTimeMillis': instance.startTimeMillis,
    };
