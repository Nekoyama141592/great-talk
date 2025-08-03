import 'dart:async';
import 'package:great_talk/core/provider/repository/purchase/purchase_repository_provider.dart';
import 'package:great_talk/infrastructure/repository/purchase_repository.dart';
import 'package:great_talk/presentation/state/purchases_state/purchases_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchases_notifier.g.dart';

@Riverpod(keepAlive: true)
class PurchasesNotifier extends _$PurchasesNotifier {
  PurchaseRepository get _repository => ref.read(purchaseRepositoryProvider);
  @override
  FutureOr<PurchasesState> build() {
    return _fetchData();
  }

  Future<PurchasesState> _fetchData() async {
    final result = await _repository.isActive();
    return PurchasesState(isProActive: result.$1, isPremiumActive: result.$2);
  }
}
