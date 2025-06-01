import 'dart:io';

import 'package:great_talk/consts/iap_constants/subscription_constants.dart';
import 'package:great_talk/consts/purchases_constants.dart';
import 'package:great_talk/extension/purchase_details_extension.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

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

  static String basicItemId() => kMonthSubscriptionId;
  static String _premiumItenId() => kPremiumSubscriptionId;

  static List<String> _itemIds() => [basicItemId(), _premiumItenId()];
  static Set<String> productIds() {
    final identifiers = _itemIds();
    return identifiers.toSet();
  }

  static List<ProductDetails> mockProducts() {
    return [
      ProductDetails(
        id: basicItemId(),
        title: PurchasesConstants.monthTitle,
        description: "一月ごとに課金されます",
        price: "¥${PurchasesConstants.monthPrice.floor()}",
        rawPrice: PurchasesConstants.monthPrice,
        currencyCode: "JPY",
        currencySymbol: "¥",
      ),
      ProductDetails(
        id: _premiumItenId(),
        title: PurchasesConstants.annualTitle,
        description: "一年ごとに課金されます",
        price: "¥${PurchasesConstants.annualPrice.floor()}",
        rawPrice: PurchasesConstants.annualPrice,
        currencyCode: "JPY",
        currencySymbol: "¥",
      ),
    ];
  }

  static InAppPurchase get inAppPurchase => InAppPurchase.instance;
  static Stream<List<PurchaseDetails>> stream() => inAppPurchase.purchaseStream;
  static Future<void> completePurchase(PurchaseDetails purchaseDetails) async {
    if (!purchaseDetails.pendingCompletePurchase) return;
    await inAppPurchase.completePurchase(purchaseDetails);
  }

  static Future<void> acknowledge(PurchaseDetails details) async {
    if (!Platform.isAndroid || details.isPending) return;
    // 承認を行う.行わないと払い戻しが行われる.
    final client = BillingClient((_) {}, (__) {});
    final serverVerificationData =
        details.verificationData.serverVerificationData;
    await client.acknowledgePurchase(serverVerificationData);
  }

  static Future<void> cancelTransctions() async {
    if (!Platform.isIOS) return;
    final wrapper = SKPaymentQueueWrapper();
    final transactions = await wrapper.transactions();
    for (final tx in transactions) {
      await wrapper.finishTransaction(tx);
    }
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
        PurchasesConstants.annualPrice / (PurchasesConstants.monthPrice * 12);
    final y = 1.0 - x; // 17.00004
    final z = (y * 100).round(); // 17を返したい
    return z;
  }
}
