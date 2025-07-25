import 'dart:io';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/infrastructure/repository/api_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:great_talk/domain/use_case_interface/purchase/i_purchase_use_case.dart';
import 'package:great_talk/core/extension/purchase_details_extension.dart';

class PurchaseUseCase implements IPurchaseUseCase {
  PurchaseUseCase(this.repository);
  final ApiRepository repository;
  @override
  FutureResult<VerifiedPurchase> verifyPurchase(
    PurchaseDetails purchaseDetails,
  ) async {
    final purchaseDetailsJson = purchaseDetails.toJson();
    return Platform.isAndroid
        ? await repository.verifyAndroidReceipt(purchaseDetailsJson)
        : await repository.verifyIOSReceipt(purchaseDetailsJson);
  }
}
