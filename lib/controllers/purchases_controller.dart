import 'dart:async';
import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/consts/chatgpt_contants.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/delegates/example_payment_queue_delegate.dart';
import 'package:great_talk/extensions/purchase_details_extension.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/receipt_response/cached_receipt/cached_receipt.dart';
import 'package:great_talk/model/receipt_response/receipt_response.dart';
import 'package:great_talk/repository/purchases_repository.dart';
import 'package:great_talk/utility/prefs_utility.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

class PurchasesController extends GetxController with CurrentUserMixin {
  static PurchasesController get to => Get.find<PurchasesController>();
  final purchases = <PurchaseDetails>[].obs;
  final Rx<CachedReceipt> rxCachedReceipt = Rx(CachedReceipt.instance());
  final InAppPurchase inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> subscription;
  final repository = PurchasesRepository();
  final products = <ProductDetails>[].obs;
  final isAvailable = false.obs;
  final loading = false.obs;

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
    await Future.wait([_initStoreInfo(), _getCachedReceipt()]);
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

  Future<void> _initStoreInfo() async {
    final bool storeConnected =
        isUseMockData || await inAppPurchase.isAvailable();
    isAvailable(storeConnected);
    if (!storeConnected) return;
    loading(true);
    await _setDelegate();
    await _fetchProducts();
    loading(false);
  }

  void _addPurchase(PurchaseDetails purchaseDetails) =>
      purchases(List.from(purchases)..add(purchaseDetails));

  bool isSubscribing() {
    return purchases.isNotEmpty || rxCachedReceipt.value.isValid();
  }

  bool isPremiumSubscribing() {
    final cachedReceipt = rxCachedReceipt.value;
    return purchases
            .map((element) => element.productID)
            .toList()
            .contains(kPremiumSubscriptionId) ||
        cachedReceipt.isValidPremium();
  }

  String get subscriptionText {
    if (!isSubscribing()) {
      return "何も契約していません。";
    } else {
      final planName = getPlanName(purchases.first.productID);
      return "$planNameを契約しています。";
    }
  }

  bool hasProductBeenPurchased(ProductDetails productDetails) {
    final purchaseIds = purchases.map((element) => element.productID).toList();
    final result = purchaseIds.contains(productDetails.id) ||
        rxCachedReceipt.value.hasProductBeenPurchased(productDetails);
    return result;
  }

  Future<void> restorePurchases() async {
    if (purchases.isEmpty) {
      await repository.restorePurchases(inAppPurchase);
    }
  }

  void onRestoreButtonPressed() async {
    purchases([]); // 購入情報を初期化
    await restorePurchases();
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
      // iOSの場合
      late bool isValid;
      final result =
          await repository.getAndroidReceipt(purchaseDetails, currentUid());
      result.when(success: (res) async {
        isValid = true;
        await _cachReceipt(res); // キャッシュを行う
      }, failure: () {
        isValid = false;
      });
      return isValid;
    } else {
      // iOSの場合
      late bool isValid;
      final result =
          await repository.getIOSReceipt(purchaseDetails, currentUid());
      result.when(success: (res) async {
        isValid = true;
        await _cachReceipt(res); // キャッシュを行う
      }, failure: () {
        isValid = false;
      });
      return isValid;
    }
  }

  Future<void> _cachReceipt(ReceiptResponse receiptResponse) async {
    rxCachedReceipt(CachedReceipt.fromReceiptResponse(receiptResponse,
        receiptResponse.originalTransactionId)); // キャッシュする前に上書き
    await PrefsUtility.setJson(
        PrefsKey.latestReceipt.name, receiptResponse.toJson());
  }

  Future<void> _getCachedReceipt() async {
    final json = await PrefsUtility.getJson(PrefsKey.latestReceipt.name);
    if (json == null) return;
    final receiptResponse = ReceiptResponse.fromJson(json);
    rxCachedReceipt(CachedReceipt.fromReceiptResponse(
        receiptResponse, receiptResponse.originalTransactionId));
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      await inAppPurchase.completePurchase(purchaseDetails);
      if (purchaseDetails.isPending) {
        await _acknowledge(
            purchaseDetails.verificationData.serverVerificationData);
      }
      // 登録しているサブスクが一つでも認証していれば、もう検証しなくて良い
      if (purchases.isNotEmpty) return;
      if (purchaseDetails.status == PurchaseStatus.error &&
          CurrentUserController.to.isAdmin()) {
        UIHelper.showErrorFlutterToast(purchaseDetails.error!.message);
      } else if (purchaseDetails.isPurchased) {
        final isValid = await verifyPurchase(purchaseDetails);
        if (isValid) {
          deliverProduct(purchaseDetails);
        }
        return;
      }
    }
  }

  Future<void> _acknowledge(String serverVerificationData) async {
    if (Platform.isAndroid) {
      // 承認を行う.行わないと払い戻しが行われる.
      BillingClient client = BillingClient((_) {});
      await client.acknowledgePurchase(serverVerificationData);
    }
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
    final result =
        await repository.buyNonConsumable(inAppPurchase, purchaseParam);
    result.when(
        success: (_) {},
        failure: () {
          UIHelper.showFlutterToast("もう一度ボタンを押してください");
        });
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

  // ChatGPTリクエスト
  int maxToken() => isPremiumSubscribing()
      ? ChatGPTConstants.gpt4MaxToken
      : ChatGPTConstants.gptTurboMaxToken;
  int maxRequestLength() => isPremiumSubscribing()
      ? ChatGPTConstants.gpt4MaxRequestLength
      : ChatGPTConstants.gptTurboMaxRequestLength;
  ChatModel model() => isPremiumSubscribing()
      ? ChatModelFromValue(model: ChatGPTConstants.premiumModel)
      : ChatModelFromValue(model: ChatGPTConstants.basicModel);
}
