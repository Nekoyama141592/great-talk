import 'dart:async';

import 'package:great_talk/consts/iap_constants/subscription_constants.dart';
import 'package:great_talk/core/purchases_core.dart';
import 'package:great_talk/extension/purchase_details_extension.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/providers/usecase/purchases/purchases_usecase.dart';
import 'package:great_talk/repository/real/local/local_repository.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchases_notifier.g.dart';

@Riverpod(keepAlive: true)
class PurchasesNotifier extends _$PurchasesNotifier {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  @override
  List<VerifiedPurchase> build() {
    _subscription = _getSubscription();
    ref.onDispose(() => _subscription.cancel());
    return _fetchPurchases();
  }

  StreamSubscription<List<PurchaseDetails>> _getSubscription() {
    final stream = PurchasesCore.stream();
    final result = stream.listen(_onListen);
    return result;
  }

  Future<void> _onListen(List<PurchaseDetails> detailsList) async {
    UIHelper.showFlutterToast('購入情報を検証しています');
    for (int i = 0; i < detailsList.length; i++) {
      final details = detailsList[i];
      if (details.isError || !details.isPurchased) continue;
      final result = await ref
          .read(purchasesUsecaseProvider)
          .verifyPurchase(details);
      await result.when(
        success: (res) => _onVerifySuccess(details, res),
        failure: _onVerifyFailed,
      );
    }
    await _updateVerifiedPurchases();
    UIHelper.showFlutterToast('購入情報の検証が完了しました');
  }

  Future<void> _onVerifySuccess(
    PurchaseDetails details,
    VerifiedPurchase res,
  ) async {
    await PurchasesCore.completePurchase(details);
    await PurchasesCore.acknowledge(details);
    await _save(res);
  }

  Future<void> _save(VerifiedPurchase res) async {
    final localRepository = ref.read(localRepositoryProvider);
    await localRepository.addVerifiedPurchase(res);
  }

  List<VerifiedPurchase> _fetchPurchases() {
    final localRepository = ref.read(localRepositoryProvider);
    return localRepository.fetchVerifiedPurchases();
  }

  Future<void> _updateVerifiedPurchases() async {
    final newVerifiedPurchases = _fetchPurchases();
    state = newVerifiedPurchases;
  }

  Future<void> _onVerifyFailed(Object e) async {
    // 失敗した時の処理.
    UIHelper.showErrorFlutterToast("購入の検証が失敗しました");
  }

  bool isSubscribing() => state.any((e) => e.isValid());
  bool isPremiumSubscribing() => state.where((e) => e.productId == kPremiumSubscriptionId).any((e) => e.isValid());
}
