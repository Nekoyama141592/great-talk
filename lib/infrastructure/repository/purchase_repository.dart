import 'package:flutter/material.dart';
import 'package:great_talk/domain/entity/purchase/product/product_entity.dart';
import 'package:great_talk/domain/repository_interface/i_purchase_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseRepository implements IPurchaseRepository {
  /// サブスクリプションが有効かどうかを返す
  /// (pro, premium) の順で返す
  @override
  Future<(bool, bool)> isActive() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      final isProActive = _getIsActive(customerInfo, 'pro');
      final isPremiumActive = _getIsActive(customerInfo, 'premium');
      return (isProActive, isPremiumActive);
    } catch (e) {
      debugPrint('isActive: ${e.toString()}');
      return (false, false);
    }
  }

  /// 購入可能なプロダクト一覧を取得する
  /// Premium,Proの順番
  @override
  Future<(List<ProductEntity>?, List<ProductEntity>?)> getProducts() async {
    try {
      final offerings = await Purchases.getOfferings();
      final premiumPackages = offerings.all['premium']?.availablePackages;
      final proPackages = offerings.all['pro']?.availablePackages;
      final premiumProducts =
          premiumPackages?.map((e) {
            final product = e.storeProduct;
            return ProductEntity(
              isPro: false,
              packageId: e.identifier,
              title: product.title,
              description: product.description,
              price: product.priceString,
            );
          }).toList();
      final proProducts =
          proPackages?.map((e) {
            final product = e.storeProduct;
            return ProductEntity(
              isPro: true,
              packageId: e.identifier,
              title: product.title,
              description: product.description,
              price: product.priceString,
            );
          }).toList();
      return (premiumProducts, proProducts);
    } catch (e) {
      debugPrint('getProducts: ${e.toString()}');
      return (null, null);
    }
  }

  /// 指定したパッケージIDの商品を購入する
  @override
  FutureResult<bool> buyProduct(String packageId) async {
    try {
      final offerings = await Purchases.getOfferings();
      final packages = [
        ...offerings.all['pro']?.availablePackages ?? [],
        ...offerings.all['premium']?.availablePackages ?? [],
      ];
      final package = packages.firstWhere((e) => e.identifier == packageId);
      final purchaseResult = await Purchases.purchasePackage(package);
      // pro, premium どちらかが有効なら true
      final isProActive = _getIsActive(purchaseResult.customerInfo, 'pro');
      final isPremiumActive = _getIsActive(
        purchaseResult.customerInfo,
        'premium',
      );
      return Result.success(isProActive || isPremiumActive);
    } catch (e) {
      debugPrint('buyProduct: ${e.toString()}');
      return const Result.failure('購入が失敗しました');
    }
  }

  /// 購入の復元を行う
  @override
  FutureResult<bool> restorePurchases() async {
    try {
      final customerInfo = await Purchases.restorePurchases();
      final isProActive = _getIsActive(customerInfo, 'pro');
      final isPremiumActive = _getIsActive(customerInfo, 'premium');
      return Result.success(isProActive || isPremiumActive);
    } catch (e) {
      debugPrint('restorePurchases: ${e.toString()}');
      return const Result.failure('購入の復元が失敗しました');
    }
  }

  /// entitlementId（pro, premium など）が有効かどうか
  bool _getIsActive(CustomerInfo purchaserInfo, String entitlementId) {
    final ent = purchaserInfo.entitlements.all[entitlementId];
    return ent?.isActive ?? false;
  }
}
