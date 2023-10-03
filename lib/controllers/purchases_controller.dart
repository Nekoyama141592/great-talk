import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/delegates/example_payment_queue_delegate.dart';
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
  final loading = false.obs;
  void _addPurchase(PurchaseDetails purchaseDetails) =>
      purchases(List.from(purchases)..add(purchaseDetails));

  bool isSubscribing() {
    return purchases.isNotEmpty;
  }

  bool hasProductBeenPurchased(ProductDetails productDetails) {
    final purchaseIds = purchases.map((element) => element.productID).toList();
    final result = purchaseIds.contains(productDetails.id);
    return result;
  }

  Future<void> restorePurchases() async {
    if (purchases.isEmpty) {
      await repository.restorePurchases(inAppPurchase);
    }
  }

  @override
  void onInit() async {
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
    await initStoreInfo();
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
    final bool storeConnected =
        isUseMockData || await inAppPurchase.isAvailable();
    isAvailable(storeConnected);
    if (!storeConnected) return;
    loading(true);
    await _setDelegate();
    await _fetchProducts();
    loading(false);
  }

  Future<void> _setDelegate() async {
    if (Platform.isIOS) {
      final iosPlatformAddition = inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }
  }

  Future<void> _fetchProducts() async {
    final result = await repository.queryProductDetails(
        inAppPurchase, kProductIds.toSet());
    result.when(success: (res) {
      products(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("商品を取得できませんでした。");
    });
  }

  void deliverProduct(PurchaseDetails purchaseDetails) {
    _addPurchase(purchaseDetails);
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
      if (purchaseDetails.status == PurchaseStatus.error &&
          CurrentUserController.to.isAdmin()) {
        UIHelper.showErrorFlutterToast(purchaseDetails.error!.message);
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

  Future<void> onPurchaseButtonPressed(ProductDetails productDetails) async {
    if (loading.value || isUseMockData) return;
    await cancelTransctions();
    final GooglePlayPurchaseDetails? oldSubscription =
        _getOldSubscription(productDetails);
    final purchaseParam = Platform.isAndroid
        ? GooglePlayPurchaseParam(
            productDetails: productDetails,
            changeSubscriptionParam:
                _getChangeSubscriptionParam(oldSubscription))
        : PurchaseParam(productDetails: productDetails);
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

  Future<void> confirmPriceChange() async {
    if (isUseMockData) return;
    if (Platform.isIOS) {
      final platformAddition = inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await platformAddition.showPriceConsentIfNeeded();
    }
  }

  Future<void> cancelTransctions() async {
    if (Platform.isIOS) {
      final paymentWrapper = SKPaymentQueueWrapper();
      final transactions = await paymentWrapper.transactions();
      for (final tx in transactions) {
        await paymentWrapper.finishTransaction(tx);
      }
    }
  }
}
