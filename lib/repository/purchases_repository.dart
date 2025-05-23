import 'package:great_talk/extensions/purchase_details_extension.dart';
import 'package:great_talk/infrastructure/cloud_functions/cloud_functions_client.dart';
import 'package:great_talk/infrastructure/open_ai/original_dio.dart';
import 'package:great_talk/model/receipt_request/receipt_request.dart';
import 'package:great_talk/model/receipt_response/receipt_response.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/utility/env_utility.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchasesRepository {
  CloudFunctionsClient get _client {
    final dio = OriginalDio.withOptions(
        baseUrl: EnvUtility().baseUrl, token: EnvUtility().apiKey);
    final client = CloudFunctionsClient(dio);
    return client;
  }

  InAppPurchase get inAppPurchase => InAppPurchase.instance;
  FutureResult<List<ProductDetails>> queryProductDetails(
      Set<String> identifiers) async {
    try {
      final ProductDetailsResponse productDetailResponse =
          await inAppPurchase.queryProductDetails(identifiers);
      final e = productDetailResponse.error;
      if (e != null) {
        return Result.failure(e);
      } else {
        return Result.success(productDetailResponse.productDetails);
      }
    } catch (e) {
      return Result.failure(e);
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

  FutureResult<ReceiptResponse> getAndroidReceipt(
      PurchaseDetails purchaseDetails, String currentUid) async {
    try {
      final request =
          ReceiptRequest(data: purchaseDetails.toJson(), uid: currentUid);
      final result = await _client.getAndroidReceipt(request);
      return Result.success(result);
    } catch (e) {
      return Result.failure(e);
    }
  }

  FutureResult<ReceiptResponse> getIOSReceipt(
      PurchaseDetails purchaseDetails, String currentUid) async {
    try {
      final request =
          ReceiptRequest(data: purchaseDetails.toJson(), uid: currentUid);
      final result = await _client.getIOSReceipt(request);
      return Result.success(result);
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
