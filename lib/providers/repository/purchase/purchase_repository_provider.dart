import 'package:great_talk/providers/global/infrastructure/in_app_purchase/in_app_purchase_provider.dart';
import 'package:great_talk/repository/purchase_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchase_repository_provider.g.dart';

@riverpod
PurchaseRepository purchaseRepository(Ref ref) => PurchaseRepository(ref.read(inAppPurchaseProvider));