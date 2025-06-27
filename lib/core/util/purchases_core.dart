import 'dart:io';

import 'package:great_talk/presentation/common/purchase_ui_core.dart';
import 'package:great_talk/consts/purchase_constants.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

class PurchasesCore {
  static PurchaseDetails purchaseDetailsFromJson(Map<String, dynamic> json) {
    return PurchaseDetails(
      purchaseID: json['purchaseID'],
      productID: json['productID'],
      verificationData: PurchaseVerificationData(
        localVerificationData:
            json['verificationData']['localVerificationData'],
        serverVerificationData:
            json['verificationData']['serverVerificationData'],
        source: json['verificationData']['source'],
      ),
      transactionDate: json['transactionDate'],
      status: PurchaseStatus.values.byName(json['status']),
    )..pendingCompletePurchase = json['pendingCompletePurchase'] ?? false;
  }

  static String basicItemId() => PurchaseUiCore.kMonthSubscriptionId;
  static String _premiumItenId() => PurchaseUiCore.kPremiumSubscriptionId;

  static List<String> _itemIds() => [basicItemId(), _premiumItenId()];
  static Set<String> productIds() {
    final identifiers = _itemIds();
    return identifiers.toSet();
  }

  static List<ProductDetails> mockProducts() {
    return [
      ProductDetails(
        id: basicItemId(),
        title: PurchaseConstants.monthTitle,
        description: "一月ごとに課金されます",
        price: "¥${PurchaseConstants.monthPrice.floor()}",
        rawPrice: PurchaseConstants.monthPrice,
        currencyCode: "JPY",
        currencySymbol: "¥",
      ),
      ProductDetails(
        id: _premiumItenId(),
        title: PurchaseConstants.annualTitle,
        description: "一年ごとに課金されます",
        price: "¥${PurchaseConstants.annualPrice.floor()}",
        rawPrice: PurchaseConstants.annualPrice,
        currencyCode: "JPY",
        currencySymbol: "¥",
      ),
    ];
  }

  static PurchaseParam param(
    ProductDetails newDetails,
    List<VerifiedPurchase>? purchases,
  ) {
    if (Platform.isAndroid) {
      final oldSubscription = _getOldSubscription(newDetails, purchases);
      return GooglePlayPurchaseParam(
        productDetails: newDetails,
        changeSubscriptionParam: _changeParam(oldSubscription),
      );
    } else {
      return PurchaseParam(productDetails: newDetails);
    }
  }

  static GooglePlayPurchaseDetails? _getOldSubscription(
    ProductDetails productDetails,
    List<VerifiedPurchase>? verifiedPurchases,
  ) {
    GooglePlayPurchaseDetails? oldSubscription;
    if (verifiedPurchases == null) return oldSubscription;
    final purchases =
        verifiedPurchases.map((e) => e.typedPurchaseDetails()).toList();
    if (purchases.isNotEmpty && purchases.last.productID != productDetails.id) {
      oldSubscription = purchases.last as GooglePlayPurchaseDetails;
    }
    return oldSubscription;
  }

  static ChangeSubscriptionParam? _changeParam(
    GooglePlayPurchaseDetails? oldDetails,
  ) {
    return (oldDetails != null)
        ? ChangeSubscriptionParam(oldPurchaseDetails: oldDetails)
        : null;
  }

  static int calculate() {
    final x =
        PurchaseConstants.annualPrice / (PurchaseConstants.monthPrice * 12);
    final y = 1.0 - x; // 17.00004
    final z = (y * 100).round(); // 17を返したい
    return z;
  }
}
