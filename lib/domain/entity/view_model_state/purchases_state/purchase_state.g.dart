// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseState _$PurchaseStateFromJson(Map<String, dynamic> json) =>
    _PurchaseState(
      verifiedPurchases:
          (json['verifiedPurchases'] as List<dynamic>)
              .map((e) => VerifiedPurchase.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PurchaseStateToJson(_PurchaseState instance) =>
    <String, dynamic>{'verifiedPurchases': instance.verifiedPurchases};
