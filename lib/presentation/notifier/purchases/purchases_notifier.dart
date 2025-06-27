import 'dart:async';

import 'package:great_talk/core/extension/purchase_details_extension.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/presentation/state/purchases_state/purchase_state.dart';
import 'package:great_talk/provider/keep_alive/stream/purchase/purchase_stream_provider.dart';
import 'package:great_talk/provider/repository/purchase/purchase_repository_provider.dart';
import 'package:great_talk/provider/keep_alive/usecase/purchases/purchase_use_case_provider.dart';
import 'package:great_talk/provider/repository/local/local_repository_provider.dart';
import 'package:great_talk/infrastructure/repository/purchase_repository.dart';
import 'package:great_talk/presentation/common/toast_ui_core.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchases_notifier.g.dart';

@Riverpod(keepAlive: true)
class PurchasesNotifier extends _$PurchasesNotifier {
  @override
  FutureOr<PurchaseState> build() => _fetchData();

  FutureOr<PurchaseState> _fetchData() async {
    final detailsList = ref.watch(purchaseStreamProvider).value ?? [];
    final purchases = await _onListen(detailsList);
    return PurchaseState(verifiedPurchases: purchases);
  }

  PurchaseRepository get _repository => ref.read(purchaseRepositoryProvider);

  Future<List<VerifiedPurchase>> _onListen(
    List<PurchaseDetails> detailsList,
  ) async {
    ToastUiCore.showFlutterToast('購入情報を検証しています');
    for (int i = 0; i < detailsList.length; i++) {
      final details = detailsList[i];
      if (details.isError || !details.isPurchased) continue;
      final result = await ref
          .read(purchaseUseCaseProvider)
          .verifyPurchase(details);
      await result.when(
        success: (res) => _onVerifySuccess(details, res),
        failure: _onVerifyFailed,
      );
    }
    ToastUiCore.showFlutterToast('購入情報の検証が完了しました');
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
    ToastUiCore.showErrorFlutterToast(msg);
  }
}
