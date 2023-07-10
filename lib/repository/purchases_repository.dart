import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/consts/env_keys.dart';
import 'package:great_talk/extensions/purchase_details_extension.dart';
import 'package:great_talk/model/ios_receipt_response/ios_receipt_response.dart';
import 'package:great_talk/repository/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchasesRepository {
  FutureResult<bool> buyNonConsumable(
      InAppPurchase inAppPurchase, PurchaseParam purchaseParam) async {
    try {
      await inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      FirebaseFirestore.instance
          .collection("purchaseErrors")
          .doc()
          .set({"error": e.toString()});
      return const Result.failure();
    }
  }

  Future<void> postAndroidPurchase(PurchaseDetails purchaseDetails) async {
    final instance = dio.Dio();
    try {
      await instance.post(dotenv.get(EnvKeys.VERIFY_ANDROID_ENDPOINT.name),
          data: {
            "data": purchaseDetails.toJson(),
          },
          options: dio.Options(method: "POST"));
    } catch (e) {
      debugPrint("$e");
    }
  }

  FutureResult<IOSReceiptResponse?> getIOSResult(String token) async {
    final instance = dio.Dio();
    try {
      final dio.Response<Map<String, dynamic>> res =
          await instance.post(dotenv.get(EnvKeys.VERIFY_IOS_ENDPOINT.name),
              data: {
                "data": token,
              },
              options: dio.Options(method: "POST"));
      final result = IOSReceiptResponse.fromJson(res.data!);
      return Result.success(result);
    } catch (e) {
      debugPrint("$e");
      return const Result.failure();
    }
  }

  Future<void> restorePurchases(InAppPurchase inAppPurchase) async {
    try {
      await inAppPurchase.restorePurchases();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
