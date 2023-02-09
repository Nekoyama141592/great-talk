import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchasesController extends GetxController {
  static PurchasesController get to => Get.find<PurchasesController>();

  RxList<PurchaseDetails> purchases = <PurchaseDetails>[].obs;
  RxList<String> tests = <String>[].obs;
  void setPurchases(List<PurchaseDetails> purchasesList) => purchases = RxList.from(purchasesList);
  void addPurchase(PurchaseDetails purchaseDetails) => purchases = RxList.from(purchases)..add(purchaseDetails);

  void addTest(String test) => tests = RxList.from(tests)..add(test);
}