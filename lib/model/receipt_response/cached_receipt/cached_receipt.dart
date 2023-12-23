import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/receipt_response/receipt_response.dart';

part 'cached_receipt.freezed.dart';
part 'cached_receipt.g.dart';

@freezed
abstract class CachedReceipt implements _$CachedReceipt {
  const CachedReceipt._();
  const factory CachedReceipt(
      {required String expiryTimeMillis,
      required String orderId,
      required String productId,
      required String startTimeMillis}) = _CachedReceipt;
  factory CachedReceipt.fromJson(Map<String, dynamic> json) =>
      _$CachedReceiptFromJson(json);

  factory CachedReceipt.fromLatestReceipt(ReceiptResponse response) {
    if (Platform.isIOS) {
      final iosReceipt = response.iosReceipt;
      return CachedReceipt(
          expiryTimeMillis: iosReceipt.expires_date_ms,
          orderId: iosReceipt.transaction_id,
          productId: iosReceipt.product_id,
          startTimeMillis: iosReceipt.purchase_date_ms);
    } else {
      final androidReceipt = response.androidReceipt;
      return CachedReceipt(
          expiryTimeMillis: androidReceipt.expiryTimeMillis,
          orderId: androidReceipt.orderId,
          productId: androidReceipt.productId,
          startTimeMillis: androidReceipt.startTimeMillis);
    }
  }

  factory CachedReceipt.instance() => const CachedReceipt(
      expiryTimeMillis: "", orderId: "", productId: "", startTimeMillis: "");
}
