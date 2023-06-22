import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:great_talk/views/components/secondary_color_button.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PurchasesController.to;
    final inAppPurchase = controller.inAppPurchase;
    return Obx((() {
      if (controller.loading.value) {
        return const Card(
            child: ListTile(
                leading: CircularProgressIndicator(),
                title: Text('情報を取得しています')));
      }

      if (!controller.isAvailable.value) return const Card();
      final ListTile productHeader = ListTile(title: boldText("プラン一覧"));
      final List<Widget> productList = controller.products.map(
        (ProductDetails productDetails) {
          final String planName = getPlanName(productDetails);
          return Obx((() => ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              title: productDetails.id == kMonthSubscriptionId
                  ? boldSecondaryColorText("$planName おすすめ！")
                  : boldText(planName),
              trailing: PurchasesController.to
                      .hasProductBeenPurchased(productDetails)
                  ? IconButton(
                      onPressed: () =>
                          controller.confirmPriceChange(context, inAppPurchase),
                      icon: const Icon(Icons.upgrade))
                  : SecondaryColorButton(
                      onPressed: () async =>
                          await controller.onPurchaseButtonPressed(
                              inAppPurchase, productDetails),
                      child: boldText("契約する")))));
        },
      ).toList();

      return Card(
          child: Column(
              children:
                  <Widget>[productHeader, const Divider()] + productList));
    }));
  }
}
