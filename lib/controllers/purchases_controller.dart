import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchasesController extends GetxController {
  static PurchasesController get to => Get.find<PurchasesController>();

  PurchasesController() {
    _fetchPurchases();
  }
  RxList<PurchaseDetails> purchases = <PurchaseDetails>[].obs;
  void setPurchases(List<PurchaseDetails> purchasesList) => purchases = RxList.from(purchasesList);
  void addPurchase(PurchaseDetails purchaseDetails) => purchases = RxList.from(purchases)..add(purchaseDetails);
  bool hasProductBeenPurchased(ProductDetails productDetails) => purchases.map((element) => element.productID).toList().contains(productDetails.id);

  Future<void> _fetchPurchases() async {
    final InAppPurchase inAppPurchase = InAppPurchase.instance;
    await inAppPurchase.restorePurchases();
    final isEmpty = await inAppPurchase.purchaseStream.isEmpty;
    if (!isEmpty) {
      final x = await inAppPurchase.purchaseStream.first;
      purchases = RxList.from(x);
    }
  }
}