// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptResponse _$$_ReceiptResponseFromJson(Map<String, dynamic> json) =>
    _$_ReceiptResponse(
      responseCode: json['responseCode'] as int,
      message: json['message'] as String,
      latestReceipt: json['latestReceipt'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_ReceiptResponseToJson(_$_ReceiptResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'latestReceipt': instance.latestReceipt,
    };
