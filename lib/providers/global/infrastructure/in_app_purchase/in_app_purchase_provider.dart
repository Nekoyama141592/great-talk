import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_app_purchase_provider.g.dart';

@Riverpod(keepAlive: true)
InAppPurchase inAppPurchase(Ref ref) => InAppPurchase.instance; 

@Riverpod(keepAlive: true)
BillingClient billingClient(Ref ref) => BillingClient((_) {}, (__) {});

@Riverpod(keepAlive: true)
SKPaymentQueueWrapper sKPaymentQueueWrapper(Ref ref) => SKPaymentQueueWrapper();