import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/bools.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/delegates/example_payment_queue_delegate.dart';
import 'package:great_talk/iap_constants/my_product_list.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:great_talk/model/ios_receipt_response/ios_receipt_response.dart';
import 'package:great_talk/repository/purchases_repository.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

class PurchasesController extends GetxController {
  static PurchasesController get to => Get.find<PurchasesController>();
  final purchases = <PurchaseDetails>[].obs;
  final InAppPurchase inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> subscription;
  final repository = PurchasesRepository();
  final products = <ProductDetails>[].obs;
  final isAvailable = false.obs;
  final purchasePending = false.obs;
  final loading = true.obs;
  final queryProductError = "".obs; // 使われていない.
  void _addPurchase(PurchaseDetails purchaseDetails) =>
      purchases(List.from(purchases)..add(purchaseDetails));
  void _setProducts(List<ProductDetails> productList) =>
      isProd() ? products(productList) : products(myProductList);

  bool isSubscribing() {
    return purchases.isNotEmpty;
  }

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
    if (purchases.isEmpty) {
      await repository.restorePurchases(inAppPurchase);
    }
  }

  @override
  void onInit() async {
    await cancelTransction();
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
      final iosPlatformAddition = inAppPurchase
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
      purchasePending(false);
      loading(false);
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      _setProducts(myProductList);
      purchasePending(false);
      loading(false);
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

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) async {
    if (Platform.isAndroid) {
      _postAndroidPurchase(purchaseDetails);
      return true;
    }
    if (Platform.isIOS) {
      final result = await getIOSResult(
          purchaseDetails.verificationData.localVerificationData);
      if (result == null) {
        await UIHelper.showFlutterToast("サーバーエラーにより、購入アイテムが検証できません");
        return false;
      } else {
        if (result.responseCode == 200) {
          return true;
        }
      }
    }
    return false;
  }

  void handleError(IAPError error) async {
    purchasePending(false);
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      await inAppPurchase.completePurchase(purchaseDetails);
      if (purchaseDetails.pendingCompletePurchase ||
          purchaseDetails.status == PurchaseStatus.pending) {
        if (Platform.isAndroid) {
          // 承認を行う.行わないと払い戻しが行われる.
          BillingClient client = BillingClient((_) {});
          await client.acknowledgePurchase(
              purchaseDetails.verificationData.serverVerificationData);
        }
      }
      // 登録しているサブスクが一つでも認証していれば、もう検証しなくて良い
      if (purchases.isNotEmpty) {
        return;
      }
      if (purchaseDetails.status == PurchaseStatus.error) {
        handleError(purchaseDetails.error!);
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        final isValid = await verifyPurchase(purchaseDetails);
        if (isValid) {
          deliverProduct(purchaseDetails);
        }
        return;
      }
    }
  }

  Future<void> _postAndroidPurchase(PurchaseDetails purchaseDetails) async {
    await repository.postAndroidPurchase(purchaseDetails);
  }

  Future<IOSReceiptResponse?> getIOSResult(String token) async {
    IOSReceiptResponse? iosReceiptResponse;
    final res = await repository.getIOSResult(token);
    res.when(success: (result) {
      iosReceiptResponse = result;
    }, failure: () {
      iosReceiptResponse = null;
    });
    return iosReceiptResponse;
  }

  Future<void> onPurchaseButtonPressed(
      InAppPurchase inAppPurchase, ProductDetails productDetails) async {
    if (loading.value) {
      return;
    }
    final GooglePlayPurchaseDetails? oldSubscription =
        _getOldSubscription(productDetails);
    late PurchaseParam purchaseParam;
    if (Platform.isAndroid) {
      purchaseParam = GooglePlayPurchaseParam(
          productDetails: productDetails,
          changeSubscriptionParam: Platform.isAndroid
              ? _getChangeSubscriptionParam(oldSubscription)
              : null);
    } else {
      purchaseParam = PurchaseParam(productDetails: productDetails);
    }
    await UIHelper.showFlutterToast("情報を取得しています。 \nしばらくお待ちください。");
    loading(true);
    await repository.buyNonConsumable(inAppPurchase, purchaseParam);
    loading(false);
  }

  ChangeSubscriptionParam? _getChangeSubscriptionParam(
      GooglePlayPurchaseDetails? oldSubscription) {
    return (oldSubscription != null)
        ? ChangeSubscriptionParam(
            oldPurchaseDetails: oldSubscription,
            prorationMode: ProrationMode.immediateWithTimeProration)
        : null;
  }

  GooglePlayPurchaseDetails? _getOldSubscription(
      ProductDetails productDetails) {
    GooglePlayPurchaseDetails? oldSubscription;
    final purchases = PurchasesController.to.purchases;
    if (purchases.isNotEmpty && purchases.last.productID != productDetails.id) {
      oldSubscription = purchases.last as GooglePlayPurchaseDetails;
    }
    return oldSubscription;
  }

  Future<void> confirmPriceChange(
      BuildContext context, InAppPurchase inAppPurchase) async {
    if (Platform.isIOS) {
      final platformAddition = inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await platformAddition.showPriceConsentIfNeeded();
    }
  }

  Future<void> cancelTransction() async {
    if (Platform.isIOS) {
      final paymentWrapper = SKPaymentQueueWrapper();
      final transactions = await paymentWrapper.transactions();
      for (final tx in transactions) {
        await paymentWrapper.finishTransaction(tx);
      }
    }
  }
}
