import 'package:flutter/material.dart';
import 'package:great_talk/core/purchases_core.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';


class PurchaseRepository {
  PurchaseRepository(this.inAppPurchase);
  InAppPurchase inAppPurchase;
  Future<bool> isAvailable() async {
    try {
      return inAppPurchase.isAvailable();
    } catch (e) {
      debugPrint('isAvailable: ${e.toString()}');
      return false;
    }
  }

  Future<List<ProductDetails>?> queryProductDetails() async {
    try {
      final identifiers = PurchasesCore.productIds();
      final res = await inAppPurchase.queryProductDetails(identifiers);
      return res.productDetails;
    } catch (e) {
      debugPrint('queryProductDetails: ${e.toString()}');
      return null;
    }
  }

  FutureResult<bool> buyNonConsumable(PurchaseParam purchaseParam) async {
    try {
      await inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      return const Result.success(true);
    } catch (e) {
      debugPrint('buyNonConsumable: ${e.toString()}');
      return Result.failure('購入が失敗しました');
    }
  }


  FutureResult<bool> restorePurchases() async {
    try {
      await inAppPurchase.restorePurchases();
      return const Result.success(true);
    } catch (e) {
      debugPrint('restorePurchases: ${e.toString()}');
      return Result.failure('購入の復元が失敗しました');
    }
  }
}