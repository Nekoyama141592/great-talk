// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AndroidReceiptResponse _$AndroidReceiptResponseFromJson(
  Map<String, dynamic> json,
) => _AndroidReceiptResponse(
  acknowledgementState: (json['acknowledgementState'] as num).toInt(),
  autoRenewing: json['autoRenewing'] as bool,
  countryCode: json['countryCode'] as String,
  developerPayload: json['developerPayload'] as String,
  expiryTimeMillis: json['expiryTimeMillis'] as String,
  kind: json['kind'] as String,
  orderId: json['orderId'] as String,
  paymentState: (json['paymentState'] as num).toInt(),
  priceAmountMicros: json['priceAmountMicros'] as String,
  priceCurrencyCode: json['priceCurrencyCode'] as String,
  productId: json['productId'] as String,
  purchaseType: (json['purchaseType'] as num).toInt(),
  startTimeMillis: json['startTimeMillis'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$AndroidReceiptResponseToJson(
  _AndroidReceiptResponse instance,
) => <String, dynamic>{
  'acknowledgementState': instance.acknowledgementState,
  'autoRenewing': instance.autoRenewing,
  'countryCode': instance.countryCode,
  'developerPayload': instance.developerPayload,
  'expiryTimeMillis': instance.expiryTimeMillis,
  'kind': instance.kind,
  'orderId': instance.orderId,
  'paymentState': instance.paymentState,
  'priceAmountMicros': instance.priceAmountMicros,
  'priceCurrencyCode': instance.priceCurrencyCode,
  'productId': instance.productId,
  'purchaseType': instance.purchaseType,
  'startTimeMillis': instance.startTimeMillis,
  'uid': instance.uid,
};
