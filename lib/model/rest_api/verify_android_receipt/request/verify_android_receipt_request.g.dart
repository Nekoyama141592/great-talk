// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_android_receipt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyAndroidReceiptRequestImpl _$$VerifyAndroidReceiptRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyAndroidReceiptRequestImpl(
      localVerificationData: json['localVerificationData'] as String,
      productID: json['productID'] as String,
    );

Map<String, dynamic> _$$VerifyAndroidReceiptRequestImplToJson(
        _$VerifyAndroidReceiptRequestImpl instance) =>
    <String, dynamic>{
      'localVerificationData': instance.localVerificationData,
      'productID': instance.productID,
    };
