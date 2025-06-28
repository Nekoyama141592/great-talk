import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/purchases_util.dart';
import 'package:great_talk/core/extension/purchase_details_extension.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:great_talk/domain/repository_interface/i_purchase_repository.dart';

class PurchaseRepository implements IPurchaseRepository {
  PurchaseRepository({
    required this.inAppPurchase,
    required this.client,
    required this.wrapper,
  });
  final InAppPurchase inAppPurchase;
  final BillingClient client;
  final SKPaymentQueueWrapper wrapper;

  @override
  Future<void> cancelTransctions() async {
    if (!Platform.isIOS) return;
    try {
      final transactions = await wrapper.transactions();
      for (final tx in transactions) {
        await wrapper.finishTransaction(tx);
      }
    } catch (e) {
      debugPrint('cancelTransactions: ${e.toString()}');
    }
  }

  @override
  Future<void> completePurchase(PurchaseDetails details) async {
    if (!details.pendingCompletePurchase) return;
    try {
      await inAppPurchase.completePurchase(details);
    } catch (e) {
      debugPrint('completePurchase: ${e.toString()}');
    }
  }

  @override
  Future<bool> isAvailable() async {
    try {
      return inAppPurchase.isAvailable();
    } catch (e) {
      debugPrint('isAvailable: ${e.toString()}');
      return false;
    }
  }

  @override
  Future<void> acknowledge(PurchaseDetails details) async {
    if (!Platform.isAndroid || details.isPending) return;
    try {
      // 承認を行う.行わないと払い戻しが行われる.
      final serverVerificationData =
          details.verificationData.serverVerificationData;
      await client.acknowledgePurchase(serverVerificationData);
    } catch (e) {
      debugPrint('acknowledge: ${e.toString()}');
    }
  }

  @override
  Future<List<ProductDetails>?> queryProductDetails() async {
    try {
      final identifiers = PurchasesUtil.productIds();
      final res = await inAppPurchase.queryProductDetails(identifiers);
      return res.productDetails;
    } catch (e) {
      debugPrint('queryProductDetails: ${e.toString()}');
      return null;
    }
  }

  @override
  FutureResult<bool> buyNonConsumable(PurchaseParam purchaseParam) async {
    try {
      await inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      return const Result.success(true);
    } catch (e) {
      debugPrint('buyNonConsumable: ${e.toString()}');
      return Result.failure('購入が失敗しました');
    }
  }

  @override
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
