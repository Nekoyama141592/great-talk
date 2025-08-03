// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchasesState {

 bool get isProActive; bool get isPremiumActive;
/// Create a copy of PurchasesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchasesStateCopyWith<PurchasesState> get copyWith => _$PurchasesStateCopyWithImpl<PurchasesState>(this as PurchasesState, _$identity);

  /// Serializes this PurchasesState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchasesState&&(identical(other.isProActive, isProActive) || other.isProActive == isProActive)&&(identical(other.isPremiumActive, isPremiumActive) || other.isPremiumActive == isPremiumActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isProActive,isPremiumActive);

@override
String toString() {
  return 'PurchasesState(isProActive: $isProActive, isPremiumActive: $isPremiumActive)';
}


}

/// @nodoc
abstract mixin class $PurchasesStateCopyWith<$Res>  {
  factory $PurchasesStateCopyWith(PurchasesState value, $Res Function(PurchasesState) _then) = _$PurchasesStateCopyWithImpl;
@useResult
$Res call({
 bool isProActive, bool isPremiumActive
});




}
/// @nodoc
class _$PurchasesStateCopyWithImpl<$Res>
    implements $PurchasesStateCopyWith<$Res> {
  _$PurchasesStateCopyWithImpl(this._self, this._then);

  final PurchasesState _self;
  final $Res Function(PurchasesState) _then;

/// Create a copy of PurchasesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isProActive = null,Object? isPremiumActive = null,}) {
  return _then(_self.copyWith(
isProActive: null == isProActive ? _self.isProActive : isProActive // ignore: cast_nullable_to_non_nullable
as bool,isPremiumActive: null == isPremiumActive ? _self.isPremiumActive : isPremiumActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PurchasesState implements PurchasesState {
  const _PurchasesState({required this.isProActive, required this.isPremiumActive});
  factory _PurchasesState.fromJson(Map<String, dynamic> json) => _$PurchasesStateFromJson(json);

@override final  bool isProActive;
@override final  bool isPremiumActive;

/// Create a copy of PurchasesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchasesStateCopyWith<_PurchasesState> get copyWith => __$PurchasesStateCopyWithImpl<_PurchasesState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchasesStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchasesState&&(identical(other.isProActive, isProActive) || other.isProActive == isProActive)&&(identical(other.isPremiumActive, isPremiumActive) || other.isPremiumActive == isPremiumActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isProActive,isPremiumActive);

@override
String toString() {
  return 'PurchasesState(isProActive: $isProActive, isPremiumActive: $isPremiumActive)';
}


}

/// @nodoc
abstract mixin class _$PurchasesStateCopyWith<$Res> implements $PurchasesStateCopyWith<$Res> {
  factory _$PurchasesStateCopyWith(_PurchasesState value, $Res Function(_PurchasesState) _then) = __$PurchasesStateCopyWithImpl;
@override @useResult
$Res call({
 bool isProActive, bool isPremiumActive
});




}
/// @nodoc
class __$PurchasesStateCopyWithImpl<$Res>
    implements _$PurchasesStateCopyWith<$Res> {
  __$PurchasesStateCopyWithImpl(this._self, this._then);

  final _PurchasesState _self;
  final $Res Function(_PurchasesState) _then;

/// Create a copy of PurchasesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isProActive = null,Object? isPremiumActive = null,}) {
  return _then(_PurchasesState(
isProActive: null == isProActive ? _self.isProActive : isProActive // ignore: cast_nullable_to_non_nullable
as bool,isPremiumActive: null == isPremiumActive ? _self.isPremiumActive : isPremiumActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
