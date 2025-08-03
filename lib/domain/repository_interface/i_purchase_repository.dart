import 'package:great_talk/domain/entity/purchase/product/product_entity.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

abstract class IPurchaseRepository {
  /// サブスクリプションが有効かどうかを返す
  Future<(bool, bool)> isActive();

  /// 購入可能なプロダクト一覧を取得する
  /// Premium,Proの順番
  Future<(List<ProductEntity>?, List<ProductEntity>?)> getProducts();

  /// 指定したパッケージIDの商品を購入する
  FutureResult<bool> buyProduct(String packageId);

  /// 購入の復元を行う
  FutureResult<bool> restorePurchases();
}
