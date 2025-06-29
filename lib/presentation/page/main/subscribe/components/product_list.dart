import 'package:flutter/material.dart';
import 'package:great_talk/presentation/util/purchase_ui_util.dart';
import 'package:great_talk/presentation/notifier/products/products_view_model.dart';
import 'package:great_talk/presentation/util/product_ui_util.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/page/main/subscribe/components/plan_description.dart';
import 'package:great_talk/presentation/page/main/subscribe/components/purchase_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(productsViewModelProvider);
    ProductsViewModel notifier() =>
        ref.read(productsViewModelProvider.notifier);
    return AsyncScreen(
      asyncValue: asyncValue,
      data: (state) {
        final productList =
            state.products.map((ProductDetails productDetails) {
              final descriptions =
                  productDetails.id == PurchaseUiUtil.kMonthSubscriptionId
                      ? const [
                        PlanDescription(text: '無制限のチャット'),
                        PlanDescription(text: 'コピー可能な説明や返答'),
                      ]
                      : [
                        const PlanDescription(text: 'ベーシックプランの全ての機能'),
                        const PlanDescription(text: "モデルの性能が向上!"),
                        const PlanDescription(text: '画像を生成するAI'),
                      ];
              final String planName = ProductUiUtil.getPlanName(
                productDetails.id,
              );
              return Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(color: Theme.of(context).focusColor),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicBoldText(planName),
                    const BasicHeightBox(),
                    BasicBoldText("${productDetails.price}/月"),
                    const BasicHeightBox(),
                    ...descriptions,
                    PurchaseButton(
                      isPurchased: state.isPurchased(productDetails.id),
                      onPressed: () async {
                        ToastUiUtil.showSuccessSnackBar(
                          context,
                          '情報を取得しています。 \nしばらくお待ちください。',
                        );
                        final result = await notifier().onPurchaseButtonPressed(
                          productDetails,
                        );
                        result.when(
                          success: (_) {
                            ToastUiUtil.showSuccessSnackBar(
                              context,
                              '購入が成功しました',
                            );
                          },
                          failure: (msg) {
                            ToastUiUtil.showFailureSnackBar(context, msg);
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            }).toList();

        return Card(child: Column(children: productList));
      },
    );
  }
}
