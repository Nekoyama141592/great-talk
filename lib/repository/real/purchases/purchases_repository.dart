import 'package:flutter/material.dart';
import 'package:great_talk/core/purchases_core.dart';
import 'package:great_talk/extension/purchase_details_extension.dart';
import 'package:great_talk/infrastructure/cloud_functions/cloud_functions_client.dart';
import 'package:great_talk/model/rest_api/verify_purchase/request/receipt_request.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/providers/client/cloud_functions/cloud_functions_client_provider.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchases_repository.g.dart';

@riverpod
PurchasesRepository purchasesRepository(Ref ref) =>
    PurchasesRepository(ref.watch(cloudFunctionsClientProvider));

class PurchasesRepository {
  PurchasesRepository(this.client);
  final CloudFunctionsClient client;
  InAppPurchase get inAppPurchase => InAppPurchase.instance;
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

  FutureResult<VerifiedPurchase> verifyAndroidReceipt(
    PurchaseDetails purchaseDetails,
  ) async {
    try {
      const name = 'verifyAndroidReceipt';
      final request = ReceiptRequest(purchaseDetails: purchaseDetails.toJson());
      final result = await client.call(name, request.toJson());
      final res = VerifiedPurchase.fromJson(result);
      return Result.success(res);
    } catch (e) {
      debugPrint('verifyAndroidReceipt: ${e.toString()}');
      return Result.failure('レシート検証が失敗しました');
    }
  }

  FutureResult<VerifiedPurchase> verifyIOSReceipt(
    PurchaseDetails purchaseDetails,
  ) async {
    try {
      const name = 'verifyIOSReceipt';
      final request = ReceiptRequest(purchaseDetails: purchaseDetails.toJson());
      final result = await client.call(name, request.toJson());
      final res = VerifiedPurchase.fromJson(result);
      return Result.success(res);
    } catch (e) {
      debugPrint('verifyIOSReceipt: ${e.toString()}');
      return Result.failure('レシート検証が失敗しました');
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