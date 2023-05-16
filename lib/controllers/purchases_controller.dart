import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/bools.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/extensions/purchase_details_extension.dart';
import 'package:great_talk/iap_constants/my_product_list.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:great_talk/delegates/example_payment_queue_delegate.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';

import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

class PurchasesController extends GetxController {
  static PurchasesController get to => Get.find<PurchasesController>();
  final purchases = <PurchaseDetails>[].obs;
  final InAppPurchase inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> subscription;
  final products = isProd() ? <ProductDetails>[].obs : myProductList.obs;
  final isAvailable = false.obs;
  final purchasePending = false.obs;
  final loading = true.obs;
  final queryProductError = "".obs; // 使われていない.

  void _addPurchase(PurchaseDetails purchaseDetails) =>
      purchases(List.from(purchases)..add(purchaseDetails));
  void _setProducts(List<ProductDetails> productList) =>
      isProd() ? products(productList) : products(myProductList);

  bool hasProductBeenPurchased(ProductDetails productDetails) {
    bool result;
    if (Platform.isAndroid) {
      result = purchases.isNotEmpty
          ? purchases.last.productID == productDetails.id
          : false;
    } else {
      result = purchases
          .map((element) => element.productID)
          .toList()
          .contains(productDetails.id);
    }
    return result;
  }

  Future<void> restorePurchases() async {
    if (purchases.isEmpty && isProd()) await inAppPurchase.restorePurchases();
  }

  @override
  void onInit() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        inAppPurchase.purchaseStream;
    subscription = purchaseUpdated.listen(
        (List<PurchaseDetails> purchaseDetailsList) {
          _listenToPurchaseUpdated(purchaseDetailsList); // 成功
        },
        onDone: () {},
        onError: (Object error) {
          // handle error here.
        });
    initStoreInfo();
    super.onInit();
  }

  @override
  void onClose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    subscription.cancel();
    super.onClose();
  }

  Future<void> initStoreInfo() async {
    final bool storeConnected = await inAppPurchase.isAvailable();
    isAvailable(storeConnected);
    if (!storeConnected) {
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
        await inAppPurchase.queryProductDetails(kProductIds.toSet());
    if (productDetailResponse.error != null) {
      queryProductError(productDetailResponse.error!.message);
      _setProducts(productDetailResponse.productDetails);
      purchasePending(false);
      loading(false);
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      _setProducts(productDetailResponse.productDetails);
      loading(false);
      purchasePending(false);
      return;
    }

    _setProducts(productDetailResponse.productDetails);
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

  void handleError(IAPError error) async {
    purchasePending(false);
    await UIHelper.showFlutterToast("購入されたアイテムが取得できませんでした");
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      _createRecept(purchaseDetails);
      if (purchaseDetails.pendingCompletePurchase ||
          purchaseDetails.status == PurchaseStatus.pending) {
        await inAppPurchase.completePurchase(purchaseDetails);
        if (Platform.isAndroid) {
          // 承認を行う.行わないと払い戻しが行われる.
          BillingClient client = BillingClient((_) {});
          await client.acknowledgePurchase(
              purchaseDetails.verificationData.serverVerificationData);
        }
      }
      if (purchaseDetails.status == PurchaseStatus.error) {
        handleError(purchaseDetails.error!);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        deliverProduct(purchaseDetails);
        return;
      }
    }
  }

  Future<void> _createRecept(PurchaseDetails purchaseDetails) async {
    try {
      await FirebaseFirestore.instance
          .collection("purchaseReceipts")
          .doc()
          .set(purchaseDetails.toJson());
    } catch (e) {
      debugPrint("$e");
    }
  }
}
