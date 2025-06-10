import 'package:great_talk/provider/keep_alive/infrastructure/in_app_purchase/in_app_purchase_provider.dart';
import 'package:great_talk/repository/purchase_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchase_repository_provider.g.dart';

@riverpod
PurchaseRepository purchaseRepository(Ref ref) => PurchaseRepository(
  inAppPurchase: ref.read(inAppPurchaseProvider),
  client: ref.read(billingClientProvider),
  wrapper: ref.read(sKPaymentQueueWrapperProvider),
);
