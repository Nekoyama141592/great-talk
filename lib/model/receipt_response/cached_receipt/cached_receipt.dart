import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:great_talk/model/receipt_response/receipt_response.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'cached_receipt.freezed.dart';
part 'cached_receipt.g.dart';

@freezed
abstract class CachedReceipt implements _$CachedReceipt {
  const CachedReceipt._();
  const factory CachedReceipt(
      {required String expiryTimeMillis,
      required String orderId,
      required String originalTransactionId,
      required String productId,
      required String startTimeMillis,
      required String uid}) = _CachedReceipt;
  factory CachedReceipt.fromJson(Map<String, dynamic> json) =>
      _$CachedReceiptFromJson(json);

  factory CachedReceipt.fromReceiptResponse(
      ReceiptResponse response, String originalTransactionId) {
    if (Platform.isIOS) {
      final iosReceipt = response.iosReceipt;
      return CachedReceipt(
          expiryTimeMillis: iosReceipt.expires_date_ms,
          orderId: iosReceipt.transaction_id,
          originalTransactionId: originalTransactionId,
          productId: iosReceipt.product_id,
          startTimeMillis: iosReceipt.purchase_date_ms,
          uid: iosReceipt.uid);
    } else {
      final androidReceipt = response.androidReceipt;
      return CachedReceipt(
          expiryTimeMillis: androidReceipt.expiryTimeMillis,
          orderId: androidReceipt.orderId,
          originalTransactionId: originalTransactionId,
          productId: androidReceipt.productId,
          startTimeMillis: androidReceipt.startTimeMillis,
          uid: androidReceipt.uid);
    }
  }

  factory CachedReceipt.instance() => const CachedReceipt(
      expiryTimeMillis: "",
      orderId: "",
      originalTransactionId: "",
      productId: "",
      startTimeMillis: "",
      uid: "");

  bool isValid() {
    final intExpiryMills = int.tryParse(expiryTimeMillis);
    if (intExpiryMills == null) {
      return false;
    } else {
      final now = DateTime.now().millisecondsSinceEpoch;
      return now < intExpiryMills;
    }
  }

  bool isValidPremium() => productId == kPremiumSubscriptionId && isValid();

  bool hasProductBeenPurchased(ProductDetails productDetails) =>
      isValid() && productId == productDetails.id;
}
