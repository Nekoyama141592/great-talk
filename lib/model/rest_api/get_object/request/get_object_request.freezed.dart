// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_object_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetObjectRequest {

 String get object;
/// Create a copy of GetObjectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetObjectRequestCopyWith<GetObjectRequest> get copyWith => _$GetObjectRequestCopyWithImpl<GetObjectRequest>(this as GetObjectRequest, _$identity);

  /// Serializes this GetObjectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetObjectRequest&&(identical(other.object, object) || other.object == object));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,object);

@override
String toString() {
  return 'GetObjectRequest(object: $object)';
}


}

/// @nodoc
abstract mixin class $GetObjectRequestCopyWith<$Res>  {
  factory $GetObjectRequestCopyWith(GetObjectRequest value, $Res Function(GetObjectRequest) _then) = _$GetObjectRequestCopyWithImpl;
@useResult
$Res call({
 String object
});




}
/// @nodoc
class _$GetObjectRequestCopyWithImpl<$Res>
    implements $GetObjectRequestCopyWith<$Res> {
  _$GetObjectRequestCopyWithImpl(this._self, this._then);

  final GetObjectRequest _self;
  final $Res Function(GetObjectRequest) _then;

/// Create a copy of GetObjectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? object = null,}) {
  return _then(_self.copyWith(
object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GetObjectRequest extends GetObjectRequest {
  const _GetObjectRequest({required this.object}): super._();
  factory _GetObjectRequest.fromJson(Map<String, dynamic> json) => _$GetObjectRequestFromJson(json);

@override final  String object;

/// Create a copy of GetObjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetObjectRequestCopyWith<_GetObjectRequest> get copyWith => __$GetObjectRequestCopyWithImpl<_GetObjectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetObjectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetObjectRequest&&(identical(other.object, object) || other.object == object));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,object);

@override
String toString() {
  return 'GetObjectRequest(object: $object)';
}


}

/// @nodoc
abstract mixin class _$GetObjectRequestCopyWith<$Res> implements $GetObjectRequestCopyWith<$Res> {
  factory _$GetObjectRequestCopyWith(_GetObjectRequest value, $Res Function(_GetObjectRequest) _then) = __$GetObjectRequestCopyWithImpl;
@override @useResult
$Res call({
 String object
});




}
/// @nodoc
class __$GetObjectRequestCopyWithImpl<$Res>
    implements _$GetObjectRequestCopyWith<$Res> {
  __$GetObjectRequestCopyWithImpl(this._self, this._then);

  final _GetObjectRequest _self;
  final $Res Function(_GetObjectRequest) _then;

/// Create a copy of GetObjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? object = null,}) {
  return _then(_GetObjectRequest(
object: null == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
