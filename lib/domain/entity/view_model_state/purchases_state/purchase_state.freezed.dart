// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseState {

 List<VerifiedPurchase> get verifiedPurchases;
/// Create a copy of PurchaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseStateCopyWith<PurchaseState> get copyWith => _$PurchaseStateCopyWithImpl<PurchaseState>(this as PurchaseState, _$identity);

  /// Serializes this PurchaseState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseState&&const DeepCollectionEquality().equals(other.verifiedPurchases, verifiedPurchases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(verifiedPurchases));

@override
String toString() {
  return 'PurchaseState(verifiedPurchases: $verifiedPurchases)';
}


}

/// @nodoc
abstract mixin class $PurchaseStateCopyWith<$Res>  {
  factory $PurchaseStateCopyWith(PurchaseState value, $Res Function(PurchaseState) _then) = _$PurchaseStateCopyWithImpl;
@useResult
$Res call({
 List<VerifiedPurchase> verifiedPurchases
});




}
/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._self, this._then);

  final PurchaseState _self;
  final $Res Function(PurchaseState) _then;

/// Create a copy of PurchaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verifiedPurchases = null,}) {
  return _then(_self.copyWith(
verifiedPurchases: null == verifiedPurchases ? _self.verifiedPurchases : verifiedPurchases // ignore: cast_nullable_to_non_nullable
as List<VerifiedPurchase>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PurchaseState extends PurchaseState {
  const _PurchaseState({required final  List<VerifiedPurchase> verifiedPurchases}): _verifiedPurchases = verifiedPurchases,super._();
  factory _PurchaseState.fromJson(Map<String, dynamic> json) => _$PurchaseStateFromJson(json);

 final  List<VerifiedPurchase> _verifiedPurchases;
@override List<VerifiedPurchase> get verifiedPurchases {
  if (_verifiedPurchases is EqualUnmodifiableListView) return _verifiedPurchases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_verifiedPurchases);
}


/// Create a copy of PurchaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseStateCopyWith<_PurchaseState> get copyWith => __$PurchaseStateCopyWithImpl<_PurchaseState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseState&&const DeepCollectionEquality().equals(other._verifiedPurchases, _verifiedPurchases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_verifiedPurchases));

@override
String toString() {
  return 'PurchaseState(verifiedPurchases: $verifiedPurchases)';
}


}

/// @nodoc
abstract mixin class _$PurchaseStateCopyWith<$Res> implements $PurchaseStateCopyWith<$Res> {
  factory _$PurchaseStateCopyWith(_PurchaseState value, $Res Function(_PurchaseState) _then) = __$PurchaseStateCopyWithImpl;
@override @useResult
$Res call({
 List<VerifiedPurchase> verifiedPurchases
});




}
/// @nodoc
class __$PurchaseStateCopyWithImpl<$Res>
    implements _$PurchaseStateCopyWith<$Res> {
  __$PurchaseStateCopyWithImpl(this._self, this._then);

  final _PurchaseState _self;
  final $Res Function(_PurchaseState) _then;

/// Create a copy of PurchaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verifiedPurchases = null,}) {
  return _then(_PurchaseState(
verifiedPurchases: null == verifiedPurchases ? _self._verifiedPurchases : verifiedPurchases // ignore: cast_nullable_to_non_nullable
as List<VerifiedPurchase>,
  ));
}


}

// dart format on
