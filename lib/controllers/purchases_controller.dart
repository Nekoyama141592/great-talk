import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/api/env.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:great_talk/delegates/example_payment_queue_delegate.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';

import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

class PurchasesController extends GetxController {
  static PurchasesController get to => Get.find<PurchasesController>();
  final purchases = <PurchaseDetails>[].obs;
  final InAppPurchase inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> subscription;
  final products = <ProductDetails>[].obs;
  final isAvailable = false.obs;
  final purchasePending = false.obs;
  final loading = true.obs;
  final queryProductError = "".obs; // 使われていない.

  void _addPurchase(PurchaseDetails purchaseDetails) => purchases(List.from(purchases)..add(purchaseDetails));

  bool hasProductBeenPurchased(ProductDetails productDetails) {
    bool result;
    if (Platform.isAndroid) {
      result = purchases.isNotEmpty ? purchases.last.productID == productDetails.id : false;
    } else {
      result = purchases.map((element) => element.productID).toList().contains(productDetails.id);
    }
    return result;
  }


  Future<void> restorePurchases() async {
    if(purchases.isEmpty) await inAppPurchase.restorePurchases();
  }

  @override
  void onInit() {
    final Stream<List<PurchaseDetails>> purchaseUpdated = inAppPurchase.purchaseStream;
    subscription = purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
        _listenToPurchaseUpdated(purchaseDetailsList); // 成功
      }, onDone: () {
       
      }, onError: (Object error) {
        // handle error here.
    });
    initStoreInfo();
    super.onInit();
  }

  @override
  void onClose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition = inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    subscription.cancel();
    super.onClose();
  }
  Future<void> initStoreInfo() async {
    final bool storeConnected = await inAppPurchase.isAvailable();
    if (!storeConnected) {
      isAvailable(storeConnected);
      products(<ProductDetails>[]);
      purchases(<PurchaseDetails>[]);
      purchasePending(false);
      loading(false);
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse = await inAppPurchase.queryProductDetails(kProductIds.toSet());
    if (productDetailResponse.error != null) {
      queryProductError (productDetailResponse.error!.message);
      isAvailable(storeConnected);
      products(productDetailResponse.productDetails);
      purchases(<PurchaseDetails>[]);
      purchasePending(false);
      loading(false);
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      queryProductError('');
      isAvailable(storeConnected);
      products(productDetailResponse.productDetails);
      purchases(<PurchaseDetails>[]);
      purchasePending(false);
      loading(false);
      return;
    }

    isAvailable(storeConnected);
    products(productDetailResponse.productDetails);
    purchasePending(false);
    loading(false);
  }

  void showPendingUI() {
    purchasePending(true);
  }

  void deliverProduct(PurchaseDetails purchaseDetails) {
    _addPurchase(purchaseDetails);
    purchasePending(false);
  }

  void handleError(IAPError error) {
    purchasePending(false);
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    if (Platform.isAndroid) {
      try {
        /// Androidの場合アイテムの購入時、レシートと同時にそのレシートの署名を取得出来ます。
        final body = json.encode({
          'signature': purchaseDetails.verificationData.serverVerificationData,
          'receipt': purchaseDetails.verificationData.localVerificationData,
        });
        /// 200以外のステータスコードを受信した場合、`catch`にて補足され即座に`false`が返却されます。
        final uri = Uri.parse(ENV.getVerifyAndroidEndpoint());
        final headers = {'Content-Type': 'application/json'};
        await http.post(uri,headers: headers, body: body);
      } catch (e) {
        await FirebaseFirestore.instance.collection("android_verify_purchase_errors").doc().set({"error": e.toString(),});
        return false;
      }
    } else if (Platform.isIOS) {
      try {
        final body = json.encode({
          'data': purchaseDetails.verificationData.localVerificationData,// Base64エンコードされたレシートデータ
        });
        /// 200以外のステータスコードを受信した場合、`catch`にて補足され即座に`false`が返却されます。
        final response = await http.post(Uri.parse(ENV.getVerifyIosEndpoint()), body: body);
        final decoded = json.decode(response.body);//サーバーから返ってきたデータ
        final transactions = decoded['transactions'];//必要なデータの取り出し
        //expires_date_msが有効期限のエポックミリ秒
        int expiresDateMs = int.parse(transactions.last['expires_date_ms']);//int型に変更
        //現在時刻を加工
        String  now = DateTime.now().toUtc().millisecondsSinceEpoch.toString();//現在時刻をエポックミリ秒に変換
        int nowMs = int.parse(now);//int型に変換
        //有効期限と現在時刻を比較
        if(expiresDateMs < nowMs) return false;
      } catch (e) {
        await FirebaseFirestore.instance.collection("ios_verify_purchase_errors").doc().set({"error": e.toString(),});
        return false;
      }
    }
    return true;
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  Future<void> _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased || purchaseDetails.status == PurchaseStatus.restored) {
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (purchaseDetails.pendingCompletePurchase) await inAppPurchase.completePurchase(purchaseDetails);
      }
    }
  }
}