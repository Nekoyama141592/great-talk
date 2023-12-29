// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AndroidReceiptResponseImpl _$$AndroidReceiptResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AndroidReceiptResponseImpl(
      acknowledgementState: json['acknowledgementState'] as int,
      autoRenewing: json['autoRenewing'] as bool,
      countryCode: json['countryCode'] as String,
      developerPayload: json['developerPayload'] as String,
      expiryTimeMillis: json['expiryTimeMillis'] as String,
      kind: json['kind'] as String,
      orderId: json['orderId'] as String,
      paymentState: json['paymentState'] as int,
      priceAmountMicros: json['priceAmountMicros'] as String,
      priceCurrencyCode: json['priceCurrencyCode'] as String,
      productId: json['productId'] as String,
      purchaseType: json['purchaseType'] as int,
      startTimeMillis: json['startTimeMillis'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$AndroidReceiptResponseImplToJson(
        _$AndroidReceiptResponseImpl instance) =>
    <String, dynamic>{
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
