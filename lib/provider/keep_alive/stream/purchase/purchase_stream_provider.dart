import 'package:great_talk/provider/keep_alive/infrastructure/in_app_purchase/in_app_purchase_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<PurchaseDetails>> purchaseStream(Ref ref) =>
    ref.watch(inAppPurchaseProvider).purchaseStream;
