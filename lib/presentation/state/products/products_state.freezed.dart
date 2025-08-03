// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsState {

 List<ProductEntity> get proProducts; List<ProductEntity> get premiumProducts;
/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsStateCopyWith<ProductsState> get copyWith => _$ProductsStateCopyWithImpl<ProductsState>(this as ProductsState, _$identity);

  /// Serializes this ProductsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsState&&const DeepCollectionEquality().equals(other.proProducts, proProducts)&&const DeepCollectionEquality().equals(other.premiumProducts, premiumProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(proProducts),const DeepCollectionEquality().hash(premiumProducts));

@override
String toString() {
  return 'ProductsState(proProducts: $proProducts, premiumProducts: $premiumProducts)';
}


}

/// @nodoc
abstract mixin class $ProductsStateCopyWith<$Res>  {
  factory $ProductsStateCopyWith(ProductsState value, $Res Function(ProductsState) _then) = _$ProductsStateCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity> proProducts, List<ProductEntity> premiumProducts
});




}
/// @nodoc
class _$ProductsStateCopyWithImpl<$Res>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._self, this._then);

  final ProductsState _self;
  final $Res Function(ProductsState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? proProducts = null,Object? premiumProducts = null,}) {
  return _then(_self.copyWith(
proProducts: null == proProducts ? _self.proProducts : proProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,premiumProducts: null == premiumProducts ? _self.premiumProducts : premiumProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProductsState implements ProductsState {
  const _ProductsState({required final  List<ProductEntity> proProducts, required final  List<ProductEntity> premiumProducts}): _proProducts = proProducts,_premiumProducts = premiumProducts;
  factory _ProductsState.fromJson(Map<String, dynamic> json) => _$ProductsStateFromJson(json);

 final  List<ProductEntity> _proProducts;
@override List<ProductEntity> get proProducts {
  if (_proProducts is EqualUnmodifiableListView) return _proProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_proProducts);
}

 final  List<ProductEntity> _premiumProducts;
@override List<ProductEntity> get premiumProducts {
  if (_premiumProducts is EqualUnmodifiableListView) return _premiumProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_premiumProducts);
}


/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsStateCopyWith<_ProductsState> get copyWith => __$ProductsStateCopyWithImpl<_ProductsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsState&&const DeepCollectionEquality().equals(other._proProducts, _proProducts)&&const DeepCollectionEquality().equals(other._premiumProducts, _premiumProducts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_proProducts),const DeepCollectionEquality().hash(_premiumProducts));

@override
String toString() {
  return 'ProductsState(proProducts: $proProducts, premiumProducts: $premiumProducts)';
}


}

/// @nodoc
abstract mixin class _$ProductsStateCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$ProductsStateCopyWith(_ProductsState value, $Res Function(_ProductsState) _then) = __$ProductsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductEntity> proProducts, List<ProductEntity> premiumProducts
});




}
/// @nodoc
class __$ProductsStateCopyWithImpl<$Res>
    implements _$ProductsStateCopyWith<$Res> {
  __$ProductsStateCopyWithImpl(this._self, this._then);

  final _ProductsState _self;
  final $Res Function(_ProductsState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? proProducts = null,Object? premiumProducts = null,}) {
  return _then(_ProductsState(
proProducts: null == proProducts ? _self._proProducts : proProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,premiumProducts: null == premiumProducts ? _self._premiumProducts : premiumProducts // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,
  ));
}


}

// dart format on
