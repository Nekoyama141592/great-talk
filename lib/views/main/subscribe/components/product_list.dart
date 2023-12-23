import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:great_talk/views/main/subscribe/components/plan_description.dart';
import 'package:great_talk/views/main/subscribe/components/product_card.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PurchasesController.to;
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
          return productDetails.id == kMonthSubscriptionId
              ? ProductCard(
                  productDetails: productDetails,
                  descriptions: const [
                      PlanDescription(text: '無制限のチャット'),
                      PlanDescription(text: 'コピー可能な説明や返答'),
                    ])
              : ProductCard(
                  productDetails: productDetails,
                  descriptions: const [
                      PlanDescription(text: 'ベーシックプランの全ての機能'),
                      PlanDescription(text: '高精度な応答をするAI'),
                      PlanDescription(text: '画像を生成するAI'),
                    ]);
        },
      ).toList();

      return Card(child: Column(children: productList));
    }));
  }
}
