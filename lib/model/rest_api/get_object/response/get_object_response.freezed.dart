// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_object_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetObjectResponse {

 String get base64Image;
/// Create a copy of GetObjectResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetObjectResponseCopyWith<GetObjectResponse> get copyWith => _$GetObjectResponseCopyWithImpl<GetObjectResponse>(this as GetObjectResponse, _$identity);

  /// Serializes this GetObjectResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetObjectResponse&&(identical(other.base64Image, base64Image) || other.base64Image == base64Image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,base64Image);

@override
String toString() {
  return 'GetObjectResponse(base64Image: $base64Image)';
}


}

/// @nodoc
abstract mixin class $GetObjectResponseCopyWith<$Res>  {
  factory $GetObjectResponseCopyWith(GetObjectResponse value, $Res Function(GetObjectResponse) _then) = _$GetObjectResponseCopyWithImpl;
@useResult
$Res call({
 String base64Image
});




}
/// @nodoc
class _$GetObjectResponseCopyWithImpl<$Res>
    implements $GetObjectResponseCopyWith<$Res> {
  _$GetObjectResponseCopyWithImpl(this._self, this._then);

  final GetObjectResponse _self;
  final $Res Function(GetObjectResponse) _then;

/// Create a copy of GetObjectResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base64Image = null,}) {
  return _then(_self.copyWith(
base64Image: null == base64Image ? _self.base64Image : base64Image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GetObjectResponse extends GetObjectResponse {
  const _GetObjectResponse({required this.base64Image}): super._();
  factory _GetObjectResponse.fromJson(Map<String, dynamic> json) => _$GetObjectResponseFromJson(json);

@override final  String base64Image;

/// Create a copy of GetObjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetObjectResponseCopyWith<_GetObjectResponse> get copyWith => __$GetObjectResponseCopyWithImpl<_GetObjectResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetObjectResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetObjectResponse&&(identical(other.base64Image, base64Image) || other.base64Image == base64Image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,base64Image);

@override
String toString() {
  return 'GetObjectResponse(base64Image: $base64Image)';
}


}

/// @nodoc
abstract mixin class _$GetObjectResponseCopyWith<$Res> implements $GetObjectResponseCopyWith<$Res> {
  factory _$GetObjectResponseCopyWith(_GetObjectResponse value, $Res Function(_GetObjectResponse) _then) = __$GetObjectResponseCopyWithImpl;
@override @useResult
$Res call({
 String base64Image
});




}
/// @nodoc
class __$GetObjectResponseCopyWithImpl<$Res>
    implements _$GetObjectResponseCopyWith<$Res> {
  __$GetObjectResponseCopyWithImpl(this._self, this._then);

  final _GetObjectResponse _self;
  final $Res Function(_GetObjectResponse) _then;

/// Create a copy of GetObjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base64Image = null,}) {
  return _then(_GetObjectResponse(
base64Image: null == base64Image ? _self.base64Image : base64Image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
