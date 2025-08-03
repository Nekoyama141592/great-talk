import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/purchase/product/product_entity.dart';

part 'products_state.freezed.dart';
part 'products_state.g.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState({
    required List<ProductEntity> proProducts,
    required List<ProductEntity> premiumProducts,
  }) = _ProductsState;
  factory ProductsState.fromJson(Map<String, dynamic> json) =>
      _$ProductsStateFromJson(json);
}
