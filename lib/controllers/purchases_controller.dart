import 'dart:async';
import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/consts/remote_config_constants.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/consts/chatgpt_contants.dart';
import 'package:great_talk/consts/purchase_constants.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/consts/delegates/payment_queue_delegate.dart';
import 'package:great_talk/extensions/purchase_details_extension.dart';
import 'package:great_talk/consts/iap_constants/mock_product_list.dart';
import 'package:great_talk/consts/iap_constants/subscription_constants.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/rest_api/receipt_response/cached_receipt/cached_receipt.dart';
import 'package:great_talk/model/rest_api/receipt_response/receipt_response.dart';
import 'package:great_talk/repository/purchases_repository.dart';
import 'package:great_talk/utility/prefs_utility.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchasesController extends GetxController with CurrentUserMixin {
  static PurchasesController get to => Get.find<PurchasesController>();
  final purchases = <PurchaseDetails>[].obs;
  final products = <ProductDetails>[].obs;
  final Rx<CachedReceipt> rxCachedReceipt = Rx(CachedReceipt.instance());

  late StreamSubscription<List<PurchaseDetails>> subscription;

  final isAvailable = false.obs;
  final loading = false.obs;

  PurchasesRepository get repository => PurchasesRepository();
  InAppPurchase get inAppPurchase => InAppPurchase.instance;

  @override
  void onInit() async {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        inAppPurchase.purchaseStream;
    subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList); // 成功
    }, onDone: () {}, onError: (Object error) {});
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

  @override
  void onReady() async {
    final result = await _getCachedReceipt();
    if (result == null) return;
    if (!result.isValid()) {
      UIHelper.simpleAlertDialog("サブスクの購入情報を更新する", positiveAction: () async {
        Get.back();
        await _clearCach();
        await _restorePurchase();
      });
    }
  }

  Future<void> _initStoreInfo() async {
    final bool storeConnected = await inAppPurchase.isAvailable();
    isAvailable(storeConnected);
    if (!storeConnected) return;
    loading(true);
    await _setDelegate();
    await _fetchProducts();
    loading(false);
  }

  bool isSubscribing() {
    return purchases.isNotEmpty ||
        rxCachedReceipt.value.isValid() ||
        CurrentUserController.to.isOfficial();
  }

  bool isPremiumSubscribing() {
    final cachedReceipt = rxCachedReceipt.value;
    return purchases
            .map((element) => element.productID)
            .toList()
            .contains(kPremiumSubscriptionId) ||
        cachedReceipt.isValidPremium() ||
        CurrentUserController.to.isOfficial();
  }

  String get subscriptionText {
    if (!isSubscribing()) {
      return "何も契約していません。";
    } else if (CurrentUserController.to.isOfficial()) {
      return "プレミアムプラン(公式ユーザー)";
    } else if (purchases.isEmpty) {
      return "購入情報を取得中...";
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

  void onRestoreButtonPressed() async {
    purchases([]); // 購入情報を初期化
    await _restorePurchase();
  }

  Future<void> _restorePurchase() async {
    final result = await repository.restorePurchases();
    result.when(success: (_) {
      UIHelper.showFlutterToast("購入の復元に成功しました。現在、サーバーで購入情報を検証しています。");
    }, failure: (e) {
      UIHelper.showErrorFlutterToast("購入の復元が失敗しました。");
    });
  }

  Future<void> _setDelegate() async {
    if (Platform.isIOS) {
      final iosPlatformAddition = inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(PaymentQueueDelegate());
    }
  }

  Future<void> _fetchProducts() async {
    final result = await repository.queryProductDetails(kProductIds.toSet());
    result.when(success: (res) {
      final sorted = res
        ..sort(
          (a, b) => a.id.compareTo(b.id),
        );
      products(sorted);
    }, failure: (e) {
      UIHelper.showErrorFlutterToast("商品を取得できませんでした。");
    });
    _fetchMockProducts();
  }

  void _fetchMockProducts() {
    if (products.isEmpty) {
      products(mockProductList);
    }
  }

  void deliverProduct(PurchaseDetails purchaseDetails) {
    purchases.add(purchaseDetails);
    UIHelper.showFlutterToast("サーバーでの検証が成功しました");
  }

  Future<bool> verifyPurchase(PurchaseDetails purchaseDetails) async {
    if (Platform.isAndroid) {
      // iOSの場合
      late bool isValid;
      final result =
          await repository.getAndroidReceipt(purchaseDetails, currentUid());
      await result.when(success: (res) async {
        isValid = true;
        await _cachReceipt(res); // キャッシュを行う
      }, failure: (e) {
        isValid = false;
      });
      return isValid;
    } else {
      // iOSの場合
      late bool isValid;
      final result =
          await repository.getIOSReceipt(purchaseDetails, currentUid());
      await result.when(success: (res) async {
        isValid = true;
        await _cachReceipt(res); // キャッシュを行う
      }, failure: (e) {
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

  Future<void> _clearCach() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(PrefsKey.latestReceipt.name);
  }

  Future<CachedReceipt?> _getCachedReceipt() async {
    final json = await PrefsUtility.getJson(PrefsKey.latestReceipt.name);
    if (json == null) {
      return null;
    }
    final receiptResponse = ReceiptResponse.fromJson(json);
    final result = CachedReceipt.fromReceiptResponse(
        receiptResponse, receiptResponse.originalTransactionId);
    rxCachedReceipt(result);
    return result;
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    if (CurrentUserController.to.isAdmin()) {
      await UIHelper.showFlutterToast(
          "${purchaseDetailsList.length}件のアイテムに対して処理を実行");
    }
    for (int i = 0; i < PurchaseConstants.verifyItemLimit; i++) {
      final purchaseDetails = purchaseDetailsList[i];
      await _completePurchase(purchaseDetails);
      await _acknowledge(purchaseDetails);
      if (purchaseDetails.status == PurchaseStatus.error &&
          CurrentUserController.to.isAdmin()) {
        UIHelper.showErrorFlutterToast(
            purchaseDetails.error?.message ?? "購入時にエラーが発生");
      } else if (purchaseDetails.isPurchased) {
        final isValid = await verifyPurchase(purchaseDetails);
        if (isValid) {
          deliverProduct(purchaseDetails);
        }
      }
    }
  }

  Future<void> _completePurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.pendingCompletePurchase) {
      await inAppPurchase.completePurchase(purchaseDetails);
    }
  }

  Future<void> _acknowledge(PurchaseDetails purchaseDetails) async {
    if (Platform.isAndroid &&
        purchaseDetails.status == PurchaseStatus.pending) {
      // 承認を行う.行わないと払い戻しが行われる.
      BillingClient client = BillingClient((_) {}, (__) {});
      final serverVerificationData =
          purchaseDetails.verificationData.serverVerificationData;
      await client.acknowledgePurchase(serverVerificationData);
    }
  }

  Future<void> onPurchaseButtonPressed(ProductDetails productDetails) async {
    if (loading.value) return;
    await cancelTransctions();
    final oldSubscription = _getOldSubscription(productDetails);
    final purchaseParam = Platform.isAndroid
        ? GooglePlayPurchaseParam(
            productDetails: productDetails,
            changeSubscriptionParam:
                _getChangeSubscriptionParam(oldSubscription))
        : PurchaseParam(productDetails: productDetails);
    await UIHelper.showFlutterToast("情報を取得しています。 \nしばらくお待ちください。");
    loading(true);
    final result = await repository.buyNonConsumable(purchaseParam);
    result.when(
        success: (_) {},
        failure: (e) {
          UIHelper.showFlutterToast("もう一度ボタンを押してください");
        });
    loading(false);
  }

  ChangeSubscriptionParam? _getChangeSubscriptionParam(
      GooglePlayPurchaseDetails? oldSubscription) {
    return (oldSubscription != null)
        ? ChangeSubscriptionParam(oldPurchaseDetails: oldSubscription)
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
  ChatModel model() {
    final model = isPremiumSubscribing()
        ? RemoteConfigConstants.premiumModel
        : RemoteConfigConstants.basicModel;
    return ChatModelFromValue(model: model);
  }
}
