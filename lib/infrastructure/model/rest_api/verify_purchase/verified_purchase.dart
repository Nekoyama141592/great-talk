import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/util/date_util.dart';
import 'package:great_talk/domain/entity/database/purchase_details/purchase_details_entity.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/response/android_receipt_response/android_receipt_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/response/ios_receipt_response/ios_receipt_response.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'verified_purchase.freezed.dart';
part 'verified_purchase.g.dart';

@freezed
abstract class VerifiedPurchase with _$VerifiedPurchase {
  const VerifiedPurchase._();
  const factory VerifiedPurchase({
    required Map<String, dynamic> purchaseDetails,
    required Map<String, dynamic> verifiedReceipt,
    required String uid,
    required String os,
  }) = _VerifiedPurchase;
  factory VerifiedPurchase.fromJson(Map<String, dynamic> json) =>
      _$VerifiedPurchaseFromJson(json);
  bool _isAndroidReceipt() {
    return os == 'Android';
  }

  AndroidReceiptResponse get _androidReceipt =>
      AndroidReceiptResponse.fromJson(verifiedReceipt);
  IOSReceiptResponse get _iosReceipt =>
      IOSReceiptResponse.fromJson(verifiedReceipt);
  PurchaseDetailsEntity typedPurchaseDetails() {
    return PurchaseDetailsEntity.fromJson(purchaseDetails);
  }

  String get productId {
    if (Platform.isIOS) {
      return _iosReceipt.product_id;
    } else {
      return typedPurchaseDetails().productID;
    }
  }

  String get expiryTimeMillis {
    return _isAndroidReceipt()
        ? _androidReceipt.expiryTimeMillis
        : _iosReceipt.expires_date_ms;
  }

  bool _isNotExpired() {
    final expireTime = DateUtil.milliSecondsToDateTime(expiryTimeMillis);
    return DateUtil.isFuture(expireTime);
  }

  bool _isValidPurchase() {
    final status = PurchaseStatus.values.byName(typedPurchaseDetails().status);
    return status == PurchaseStatus.purchased ||
        status == PurchaseStatus.restored;
  }

  bool isValid() {
    return _isNotExpired() && _isValidPurchase();
  }

  int purchaseDateMs() {
    if (Platform.isIOS) {
      return int.parse(_iosReceipt.purchase_date_ms);
    } else {
      return int.parse(_androidReceipt.startTimeMillis);
    }
  }

  bool isAutoRenew() {
    if (Platform.isIOS) {
      return _iosReceipt.typedPendingRenewalInfo()?.isAutoRenew() ?? false;
    } else {
      throw Error();
    }
  }

  String get originalTransactionId =>
      Platform.isIOS
          ? _iosReceipt.original_transaction_id
          : removeTrailingDots(_androidReceipt.orderId);

  String removeTrailingDots(String input) {
    // 正規表現を使用して「..」以降の文字を取り除く
    RegExp regex = RegExp(r'\.\.');
    int matchIndex = regex.firstMatch(input)?.start ?? -1;

    if (matchIndex != -1) {
      // 「..」以降の文字を取り除く
      return input.substring(0, matchIndex);
    } else {
      // 「..」が見つからない場合は元の文字列をそのまま返す
      return input;
    }
  }
}
