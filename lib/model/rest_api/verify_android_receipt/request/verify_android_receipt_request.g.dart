// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_android_receipt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyAndroidReceiptRequest _$VerifyAndroidReceiptRequestFromJson(
        Map<String, dynamic> json) =>
    _VerifyAndroidReceiptRequest(
      localVerificationData: json['localVerificationData'] as String,
      productID: json['productID'] as String,
    );

Map<String, dynamic> _$VerifyAndroidReceiptRequestToJson(
        _VerifyAndroidReceiptRequest instance) =>
    <String, dynamic>{
      'localVerificationData': instance.localVerificationData,
      'productID': instance.productID,
    };
