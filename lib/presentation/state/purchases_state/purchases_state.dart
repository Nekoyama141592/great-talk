import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchases_state.freezed.dart';
part 'purchases_state.g.dart';

@freezed
abstract class PurchasesState with _$PurchasesState {
  const factory PurchasesState({
    required bool isProActive,
    required bool isPremiumActive,
  }) = _PurchasesState;
  factory PurchasesState.fromJson(Map<String, dynamic> json) =>
      _$PurchasesStateFromJson(json);
}
