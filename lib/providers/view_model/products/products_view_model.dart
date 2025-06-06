import 'dart:async';
import 'package:great_talk/core/purchases_core.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/model/view_model_state/purchases/purchases_state.dart';
import 'package:great_talk/providers/global/purchases/purchases_notifier.dart';
import 'package:great_talk/repository/real/local/local_repository.dart';
import 'package:great_talk/repository/real/purchases/purchases_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
part 'products_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProductsViewModel extends _$ProductsViewModel {
  late ProviderSubscription<List<VerifiedPurchase>> _subscription;
  @override
  FutureOr<PurchasesState> build() async {
    _subscription = ref.listen(purchasesNotifierProvider, _onListen);
    ref.onDispose(_subscription.close);
    return _fetch();
  }

  void _onListen(List<VerifiedPurchase>? before, List<VerifiedPurchase> after) {
    final stateValue = state.value;
    if (stateValue == null) return;
    state = AsyncData(stateValue.copyWith(verifiedPurchases: after));
  }

  PurchasesRepository get _repository => ref.read(purchasesRepositoryProvider);

  Future<PurchasesState> _fetch() async {
    final mockProducts = PurchasesCore.mockProducts();
    final storeConnected = await _repository.isAvailable();
    if (!storeConnected) {
      return PurchasesState(storeConnected: false, products: mockProducts);
    }
    final res = await _repository.queryProductDetails();
    final products = (res != null && res.isNotEmpty) ? res : mockProducts;
    final verifiedPurchases = _fetchPurchases();
    return PurchasesState(
      products: products,
      verifiedPurchases: verifiedPurchases,
      storeConnected: storeConnected,
    );
  }

  List<VerifiedPurchase> _fetchPurchases() {
    final localRepository = ref.read(localRepositoryProvider);
    return localRepository.fetchVerifiedPurchases();
  }

  FutureResult<bool> onPurchaseButtonPressed(ProductDetails details) async {
    final storeConnected = state.value?.storeConnected ?? false;
    if (!storeConnected) {
      return const Result.failure('ストアに接続ができませんでした');
    }
    await PurchasesCore.cancelTransctions();
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
