import 'package:flutter/material.dart';
import 'package:great_talk/core/purchases_core.dart';
import 'package:great_talk/extensions/purchase_details_extension.dart';
import 'package:great_talk/infrastructure/cloud_functions/on_call_client.dart';
import 'package:great_talk/model/rest_api/verify_purchase/request/receipt_request.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchasesRepository {
  InAppPurchase get inAppPurchase => InAppPurchase.instance;
  OnCallClient get _client => OnCallClient();
  Future<bool> isAvailable() async {
    try {
      return inAppPurchase.isAvailable();
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
  Future<List<ProductDetails>?> queryProductDetails() async {
    try {
      final identifiers = PurchasesCore.productIds();
      final res = await inAppPurchase.queryProductDetails(identifiers);
      return res.productDetails;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  FutureResult<bool> buyNonConsumable(PurchaseParam purchaseParam) async {
    try {
      await inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      return const Result.success(true);
    } catch (e) {
      return Result.failure(e);
    }
  }


  FutureResult<VerifiedPurchase> verifyAndroidReceipt(
      PurchaseDetails purchaseDetails) async {
    try {
      const name = 'verifyAndroidReceipt';
      final request = ReceiptRequest(purchaseDetails: purchaseDetails.toJson());
      final result = await _client.call(name, request.toJson());
      final res = VerifiedPurchase.fromJson(result);
      return Result.success(res);
    } catch (e) {
      return Result.failure(e);
    }
  }

  FutureResult<VerifiedPurchase> verifyIOSReceipt(
      PurchaseDetails purchaseDetails) async {
    try {
      const name = 'verifyIOSReceipt';
      final request = ReceiptRequest(purchaseDetails: purchaseDetails.toJson());
      final result = await _client.call(name, request.toJson());
      final res = VerifiedPurchase.fromJson(result);
      return Result.success(res);
    } catch (e) {
      return Result.failure(e);
    }
  }

  FutureResult<bool> restorePurchases() async {
    try {
      await inAppPurchase.restorePurchases();
      return const Result.success(true);
    } catch (e) {
      return Result.failure(e);
    }
  }
}
