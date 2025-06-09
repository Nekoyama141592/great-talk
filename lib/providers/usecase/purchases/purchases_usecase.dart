import 'dart:io';

import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/providers/repository/api/api_repository_provider.dart';
import 'package:great_talk/repository/api_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchases_usecase.g.dart';

@riverpod
PurchasesUsecase purchasesUsecase(Ref ref) =>
    PurchasesUsecase(ref.watch(apiRepositoryProvider));

class PurchasesUsecase {
  PurchasesUsecase(this.repository);
  final ApiRepository repository;
  FutureResult<VerifiedPurchase> verifyPurchase(
    PurchaseDetails purchaseDetails,
  ) async {
    return Platform.isAndroid
        ? await repository.verifyAndroidReceipt(purchaseDetails)
        : await repository.verifyIOSReceipt(purchaseDetails);
  }
}
