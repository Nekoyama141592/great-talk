import 'package:flutter/material.dart';
import 'package:great_talk/domain/entity/purchase/product/product_entity.dart';
import 'package:great_talk/presentation/notifier/products/products_notifier.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/page/main/subscribe/components/purchase_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(productsNotifierProvider);
    ProductsNotifier notifier() => ref.read(productsNotifierProvider.notifier);
    final purchasesState = ref.watch(purchasesNotifierProvider);
    final isProActive = purchasesState.value?.isProActive ?? false;
    final isPremiumActive = purchasesState.value?.isPremiumActive ?? false;
    return AsyncScreen(
      asyncValue: asyncValue,
      data: (state) {
        final proProduct = state.proProducts.first;
        final premiumProduct = state.premiumProducts.first;
        void onPressed(ProductEntity product) async {
          ToastUiUtil.showSuccessSnackBar(
            context,
            '情報を取得しています。 \nしばらくお待ちください。',
          );
          final result = await notifier().onPurchaseButtonPressed(product);
          result.when(
            success: (_) {
              ToastUiUtil.showSuccessSnackBar(context, '購入が成功しました');
              ref.invalidate(purchasesNotifierProvider);
            },
            failure: (msg) {
              ToastUiUtil.showFailureSnackBar(context, msg);
            },
          );
        }

        return Card(
          child: Column(
            children: [
              ProductCard(
                product: proProduct,
                onPurchaseButtonPressed: onPressed,
                isPurchased: isProActive,
              ),
              ProductCard(
                product: premiumProduct,
                onPurchaseButtonPressed: onPressed,
                isPurchased: isPremiumActive,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onPurchaseButtonPressed,
    required this.isPurchased,
  });
  final ProductEntity product;
  final bool isPurchased;
  final void Function(ProductEntity) onPurchaseButtonPressed;
  @override
  Widget build(BuildContext context) {
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
          BasicBoldText(product.title),
          const BasicHeightBox(),
          BasicBoldText("${product.price}/月"),
          const BasicHeightBox(),
          PurchaseButton(
            isPurchased: isPurchased,
            onPressed: () => onPurchaseButtonPressed(product),
          ),
        ],
      ),
    );
  }
}
