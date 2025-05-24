// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateImageResponse {

 String get base64;
/// Create a copy of GenerateImageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateImageResponseCopyWith<GenerateImageResponse> get copyWith => _$GenerateImageResponseCopyWithImpl<GenerateImageResponse>(this as GenerateImageResponse, _$identity);

  /// Serializes this GenerateImageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateImageResponse&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,base64);

@override
String toString() {
  return 'GenerateImageResponse(base64: $base64)';
}


}

/// @nodoc
abstract mixin class $GenerateImageResponseCopyWith<$Res>  {
  factory $GenerateImageResponseCopyWith(GenerateImageResponse value, $Res Function(GenerateImageResponse) _then) = _$GenerateImageResponseCopyWithImpl;
@useResult
$Res call({
 String base64
});




}
/// @nodoc
class _$GenerateImageResponseCopyWithImpl<$Res>
    implements $GenerateImageResponseCopyWith<$Res> {
  _$GenerateImageResponseCopyWithImpl(this._self, this._then);

  final GenerateImageResponse _self;
  final $Res Function(GenerateImageResponse) _then;

/// Create a copy of GenerateImageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base64 = null,}) {
  return _then(_self.copyWith(
base64: null == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenerateImageResponse extends GenerateImageResponse {
  const _GenerateImageResponse({required this.base64}): super._();
  factory _GenerateImageResponse.fromJson(Map<String, dynamic> json) => _$GenerateImageResponseFromJson(json);

@override final  String base64;

/// Create a copy of GenerateImageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateImageResponseCopyWith<_GenerateImageResponse> get copyWith => __$GenerateImageResponseCopyWithImpl<_GenerateImageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateImageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateImageResponse&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,base64);

@override
String toString() {
  return 'GenerateImageResponse(base64: $base64)';
}


}

/// @nodoc
abstract mixin class _$GenerateImageResponseCopyWith<$Res> implements $GenerateImageResponseCopyWith<$Res> {
  factory _$GenerateImageResponseCopyWith(_GenerateImageResponse value, $Res Function(_GenerateImageResponse) _then) = __$GenerateImageResponseCopyWithImpl;
@override @useResult
$Res call({
 String base64
});




}
/// @nodoc
class __$GenerateImageResponseCopyWithImpl<$Res>
    implements _$GenerateImageResponseCopyWith<$Res> {
  __$GenerateImageResponseCopyWithImpl(this._self, this._then);

  final _GenerateImageResponse _self;
  final $Res Function(_GenerateImageResponse) _then;

/// Create a copy of GenerateImageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base64 = null,}) {
  return _then(_GenerateImageResponse(
base64: null == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
