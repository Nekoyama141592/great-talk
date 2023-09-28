import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/texts.dart';
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

      if (!controller.isAvailable.value) return const SizedBox.shrink();
      final List<Widget> productList = controller.products.map(
        (ProductDetails productDetails) {
          final String planName = getPlanName(productDetails);
          return Obx((() => ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              title: productDetails.id == kMonthSubscriptionId
                  ? SecondaryColorText("$planName おすすめ！")
                  : BasicBoldText(planName),
              trailing: PurchasesController.to
                      .hasProductBeenPurchased(productDetails)
                  ? PurchaseButton(
                      color: Colors.grey.withOpacity(0.8),
                      onPressed: () =>
                          controller.confirmPriceChange(context, inAppPurchase),
                      child: const BoldWhiteText("契約中"),
                    )
                  : PurchaseButton(
                      color: kSecondaryColor,
                      onPressed: () async =>
                          await controller.onPurchaseButtonPressed(
                              inAppPurchase, productDetails),
                      child: const BoldWhiteText("契約する")))));
        },
      ).toList();

      return Card(
          child: Column(children: <Widget>[const Divider()] + productList));
    }));
  }
}
