import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';

class InAppPurchaseApi {
  static void onPurchaseButtonPressed(InAppPurchase inAppPurchase,ProductDetails productDetails) {
    final GooglePlayPurchaseDetails? oldSubscription = _getOldSubscription(productDetails);
    late PurchaseParam purchaseParam;
    if (Platform.isAndroid) {
      purchaseParam = GooglePlayPurchaseParam(
        productDetails: productDetails,
        changeSubscriptionParam: (oldSubscription != null)
        ? ChangeSubscriptionParam(oldPurchaseDetails: oldSubscription,prorationMode:ProrationMode.immediateWithTimeProration)
        : null
      );
    } else {
      purchaseParam = PurchaseParam(productDetails: productDetails);
    }
    inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  static GooglePlayPurchaseDetails? _getOldSubscription(ProductDetails productDetails) {
    GooglePlayPurchaseDetails? oldSubscription;
    final purchases = PurchasesController.to.purchases;
    if (purchases.isNotEmpty && purchases.last.productID != productDetails.id) oldSubscription = purchases.last as GooglePlayPurchaseDetails;
    return oldSubscription;
  }

  static Future<void> confirmPriceChange(BuildContext context,InAppPurchase inAppPurchase) async {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iapStoreKitPlatformAddition = inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iapStoreKitPlatformAddition.showPriceConsentIfNeeded();
    }
  }
}