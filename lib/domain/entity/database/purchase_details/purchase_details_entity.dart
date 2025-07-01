import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_details_entity.freezed.dart';
part 'purchase_details_entity.g.dart';

@freezed
abstract class PurchaseDetailsEntity with _$PurchaseDetailsEntity {
  const factory PurchaseDetailsEntity({
    required String productID,
    required String status,
  }) = _PurchaseDetailsEntity;

  factory PurchaseDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDetailsEntityFromJson(json);
}
