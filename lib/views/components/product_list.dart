import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/api/in_app_purchase_api.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
class ProductList extends StatelessWidget {
  const ProductList({Key? key,required this.loading,required this.isAvailable,required this.inAppPurchase,required this.products}) : super(key: key);
  final bool loading;
  final bool isAvailable;
  final InAppPurchase inAppPurchase;
  final List<ProductDetails> products;

  @override 
  Widget build(BuildContext context) {
    if (loading) return const Card(child: ListTile(leading: CircularProgressIndicator(),title: Text('情報を取得しています')));
    if (!isAvailable) return const Card();
    final ListTile productHeader = ListTile(title: boldText("プラン一覧"));
    final List<Widget> productList = <Widget>[];
    productList.addAll(products.map(
      (ProductDetails productDetails) {
        return Obx((() => ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
          title: productDetails.id == kMonthSubscriptionId ? boldSecondaryColorText("${productDetails.title} おすすめ！") : boldText(productDetails.title),
          trailing: PurchasesController.to.hasProductBeenPurchased(productDetails)
          ? IconButton(onPressed: () => InAppPurchaseApi.confirmPriceChange(context,inAppPurchase),icon: const Icon(Icons.upgrade))
          : ElevatedButton(
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kSecondaryColor)),
            onPressed: () => InAppPurchaseApi.onPurchaseButtonPressed(inAppPurchase, productDetails),
            child: Text(productDetails.price),
          )
        )));
      },
    ));

    return Card(child: Column(children: <Widget>[productHeader, const Divider()] + productList));
  }
}