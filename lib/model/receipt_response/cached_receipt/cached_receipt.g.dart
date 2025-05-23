// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CachedReceipt _$CachedReceiptFromJson(Map<String, dynamic> json) =>
    _CachedReceipt(
      expiryTimeMillis: json['expiryTimeMillis'] as String,
      orderId: json['orderId'] as String,
      originalTransactionId: json['originalTransactionId'] as String,
      productId: json['productId'] as String,
      startTimeMillis: json['startTimeMillis'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$CachedReceiptToJson(_CachedReceipt instance) =>
    <String, dynamic>{
      'expiryTimeMillis': instance.expiryTimeMillis,
      'orderId': instance.orderId,
      'originalTransactionId': instance.originalTransactionId,
      'productId': instance.productId,
      'startTimeMillis': instance.startTimeMillis,
      'uid': instance.uid,
    };
