// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ios_receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IOSReceiptResponse _$$_IOSReceiptResponseFromJson(
        Map<String, dynamic> json) =>
    _$_IOSReceiptResponse(
      responseCode: json['responseCode'] as int,
      message: json['message'] as String,
      latestReceipt: json['latestReceipt'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_IOSReceiptResponseToJson(
        _$_IOSReceiptResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'latestReceipt': instance.latestReceipt,
    };
