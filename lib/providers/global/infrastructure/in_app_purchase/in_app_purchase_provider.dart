import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_app_purchase_provider.g.dart';

@Riverpod(keepAlive: true)
InAppPurchase inAppPurchase(Ref ref) => InAppPurchase.instance; 