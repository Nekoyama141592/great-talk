import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
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


  bool hasProductBeenPurchased(ProductDetails productDetails) => purchases.map((element) => element.productID).toList().contains(productDetails.id);

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

  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify purchase details before delivering the product.
    _addPurchase(purchaseDetails);
    purchasePending(false);
  }

  void handleError(IAPError error) {
    purchasePending(false);
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
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