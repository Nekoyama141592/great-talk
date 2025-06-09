import 'dart:async';

import 'package:great_talk/consts/iap_constants/subscription_constants.dart';
import 'package:great_talk/extension/purchase_details_extension.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/providers/global/stream/purchase/purchase_stream_provider.dart';
import 'package:great_talk/providers/repository/purchase/purchase_repository_provider.dart';
import 'package:great_talk/providers/usecase/purchases/purchases_usecase.dart';
import 'package:great_talk/providers/repository/local/local_repository_provider.dart';
import 'package:great_talk/repository/purchase_repository.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchases_notifier.g.dart';

@Riverpod(keepAlive: true)
class PurchasesNotifier extends _$PurchasesNotifier {
  @override
  FutureOr<List<VerifiedPurchase>> build() async {
    final detailsList = ref.watch(purchaseStreamProvider).value ?? [];
    return _onListen(detailsList);
  }

  PurchaseRepository get _repository => ref.read(purchaseRepositoryProvider);

  Future<List<VerifiedPurchase>> _onListen(List<PurchaseDetails> detailsList) async {
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
    UIHelper.showFlutterToast('購入情報の検証が完了しました');
    return _fetchPurchases();
  }

  Future<void> _onVerifySuccess(
    PurchaseDetails details,
    VerifiedPurchase res,
  ) async {
    await _repository.completePurchase(details);
    await _repository.acknowledge(details);
    await ref.read(localRepositoryProvider).addVerifiedPurchase(res);
  }

  List<VerifiedPurchase> _fetchPurchases() {
    final localRepository = ref.read(localRepositoryProvider);
    return localRepository.fetchVerifiedPurchases();
  }

  Future<void> _onVerifyFailed(String msg) async {
    // 失敗した時の処理.
    UIHelper.showErrorFlutterToast(msg);
  }

  bool isSubscribing() => state.value?.any((e) => e.isValid()) ?? false;
  bool isPremiumSubscribing() => state.value?.where((e) => e.productId == kPremiumSubscriptionId).any((e) => e.isValid()) ?? false;
}
