// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ios_receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IOSReceiptResponse _$$_IOSReceiptResponseFromJson(
        Map<String, dynamic> json) =>
    _$_IOSReceiptResponse(
      expires_date: json['expires_date'] as String,
      expires_date_ms: json['expires_date_ms'] as String,
      expires_date_pst: json['expires_date_pst'] as String,
      in_app_ownership_type: json['in_app_ownership_type'] as String,
      is_in_intro_offer_period: json['is_in_intro_offer_period'] as String,
      is_trial_period: json['is_trial_period'] as String,
      original_purchase_date: json['original_purchase_date'] as String,
      original_purchase_date_ms: json['original_purchase_date_ms'] as String,
      original_purchase_date_pst: json['original_purchase_date_pst'] as String,
      original_transaction_id: json['original_transaction_id'] as String,
      product_id: json['product_id'] as String,
      purchase_date: json['purchase_date'] as String,
      purchase_date_ms: json['purchase_date_ms'] as String,
      purchase_date_pst: json['purchase_date_pst'] as String,
      quantity: json['quantity'] as String,
      subscription_group_identifier:
          json['subscription_group_identifier'] as String,
      transaction_id: json['transaction_id'] as String,
      uid: json['uid'] as String,
      web_order_line_item_id: json['web_order_line_item_id'] as String,
    );

Map<String, dynamic> _$$_IOSReceiptResponseToJson(
        _$_IOSReceiptResponse instance) =>
    <String, dynamic>{
      'expires_date': instance.expires_date,
      'expires_date_ms': instance.expires_date_ms,
      'expires_date_pst': instance.expires_date_pst,
      'in_app_ownership_type': instance.in_app_ownership_type,
      'is_in_intro_offer_period': instance.is_in_intro_offer_period,
      'is_trial_period': instance.is_trial_period,
      'original_purchase_date': instance.original_purchase_date,
      'original_purchase_date_ms': instance.original_purchase_date_ms,
      'original_purchase_date_pst': instance.original_purchase_date_pst,
      'original_transaction_id': instance.original_transaction_id,
      'product_id': instance.product_id,
      'purchase_date': instance.purchase_date,
      'purchase_date_ms': instance.purchase_date_ms,
      'purchase_date_pst': instance.purchase_date_pst,
      'quantity': instance.quantity,
      'subscription_group_identifier': instance.subscription_group_identifier,
      'transaction_id': instance.transaction_id,
      'uid': instance.uid,
      'web_order_line_item_id': instance.web_order_line_item_id,
    };
