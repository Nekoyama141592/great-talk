import 'dart:async';
import 'package:great_talk/util/purchases_core.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/presentation/state/purchases/purchases_state.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/provider/repository/purchase/purchase_repository_provider.dart';
import 'package:great_talk/infrastructure/repository/purchase_repository.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
part 'products_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProductsViewModel extends _$ProductsViewModel {
  @override
  FutureOr<PurchasesState> build() async {
    final value =
        ref.watch(purchasesNotifierProvider).value?.verifiedPurchases ?? [];
    return _fetch(value);
  }

  PurchaseRepository get _repository => ref.read(purchaseRepositoryProvider);

  Future<PurchasesState> _fetch(
    List<VerifiedPurchase> verifiedPurchases,
  ) async {
    final mockProducts = PurchasesCore.mockProducts();
    final storeConnected = await _repository.isAvailable();
    if (!storeConnected) {
      return PurchasesState(storeConnected: false, products: mockProducts);
    }
    final res = await _repository.queryProductDetails();
    final products = (res != null && res.isNotEmpty) ? res : mockProducts;
    return PurchasesState(
      products: products,
      verifiedPurchases: verifiedPurchases,
      storeConnected: storeConnected,
    );
  }

  FutureResult<bool> onPurchaseButtonPressed(ProductDetails details) async {
    final storeConnected = state.value?.storeConnected ?? false;
    if (!storeConnected) {
      return const Result.failure('ストアに接続ができませんでした');
    }
    await _repository.cancelTransctions();
    final purchaseParam = PurchasesCore.param(
      details,
      state.value?.verifiedPurchases,
    );
    final result = await _repository.buyNonConsumable(purchaseParam);
    return result;
  }

  FutureResult<bool> onRestoreButtonPressed() {
    return _repository.restorePurchases();
  }
}
