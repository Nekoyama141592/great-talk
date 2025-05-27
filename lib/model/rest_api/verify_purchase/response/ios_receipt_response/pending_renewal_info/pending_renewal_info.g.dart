// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_renewal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PendingRenewalInfo _$PendingRenewalInfoFromJson(Map<String, dynamic> json) =>
    _PendingRenewalInfo(
      auto_renew_product_id: json['auto_renew_product_id'] as String,
      auto_renew_status: json['auto_renew_status'] as String,
      original_transaction_id: json['original_transaction_id'] as String,
      product_id: json['product_id'] as String,
    );

Map<String, dynamic> _$PendingRenewalInfoToJson(_PendingRenewalInfo instance) =>
    <String, dynamic>{
      'auto_renew_product_id': instance.auto_renew_product_id,
      'auto_renew_status': instance.auto_renew_status,
      'original_transaction_id': instance.original_transaction_id,
      'product_id': instance.product_id,
    };
