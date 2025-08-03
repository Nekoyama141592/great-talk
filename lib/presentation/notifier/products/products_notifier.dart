import 'dart:async';

import 'package:great_talk/core/provider/repository/purchase/purchase_repository_provider.dart';
import 'package:great_talk/domain/entity/purchase/product/product_entity.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/infrastructure/repository/purchase_repository.dart';
import 'package:great_talk/presentation/state/products/products_state.dart';
import 'package:great_talk/presentation/util/purchase_ui_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'products_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProductsNotifier extends _$ProductsNotifier {
  @override
  FutureOr<ProductsState> build() async {
    return _fetch();
  }

  PurchaseRepository get repository => ref.watch(purchaseRepositoryProvider);

  Future<ProductsState> _fetch() async {
    final res = await repository.getProducts();
    final premium = res.$1;
    final pro = res.$2;
    return ProductsState(
      premiumProducts:
          (premium != null && premium.isNotEmpty)
              ? premium
              : PurchaseUiUtil.mockPremiumProducts(),
      proProducts:
          (pro != null && pro.isNotEmpty)
              ? pro
              : PurchaseUiUtil.mockProProducts(),
    );
  }

  FutureResult<bool> onPurchaseButtonPressed(ProductEntity product) async {
    final result = await repository.buyProduct(product.packageId);
    return result;
  }

  FutureResult<bool> onRestoreButtonPressed() async {
    return await repository.restorePurchases();
  }
}
