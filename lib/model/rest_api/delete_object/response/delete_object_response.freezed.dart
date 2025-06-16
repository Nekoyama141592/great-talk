// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_object_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteObjectResponse {

 int? get httpStatusCode;
/// Create a copy of DeleteObjectResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteObjectResponseCopyWith<DeleteObjectResponse> get copyWith => _$DeleteObjectResponseCopyWithImpl<DeleteObjectResponse>(this as DeleteObjectResponse, _$identity);

  /// Serializes this DeleteObjectResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteObjectResponse&&(identical(other.httpStatusCode, httpStatusCode) || other.httpStatusCode == httpStatusCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,httpStatusCode);

@override
String toString() {
  return 'DeleteObjectResponse(httpStatusCode: $httpStatusCode)';
}


}

/// @nodoc
abstract mixin class $DeleteObjectResponseCopyWith<$Res>  {
  factory $DeleteObjectResponseCopyWith(DeleteObjectResponse value, $Res Function(DeleteObjectResponse) _then) = _$DeleteObjectResponseCopyWithImpl;
@useResult
$Res call({
 int? httpStatusCode
});




}
/// @nodoc
class _$DeleteObjectResponseCopyWithImpl<$Res>
    implements $DeleteObjectResponseCopyWith<$Res> {
  _$DeleteObjectResponseCopyWithImpl(this._self, this._then);

  final DeleteObjectResponse _self;
  final $Res Function(DeleteObjectResponse) _then;

/// Create a copy of DeleteObjectResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? httpStatusCode = freezed,}) {
  return _then(_self.copyWith(
httpStatusCode: freezed == httpStatusCode ? _self.httpStatusCode : httpStatusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DeleteObjectResponse extends DeleteObjectResponse {
  const _DeleteObjectResponse({required this.httpStatusCode}): super._();
  factory _DeleteObjectResponse.fromJson(Map<String, dynamic> json) => _$DeleteObjectResponseFromJson(json);

@override final  int? httpStatusCode;

/// Create a copy of DeleteObjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteObjectResponseCopyWith<_DeleteObjectResponse> get copyWith => __$DeleteObjectResponseCopyWithImpl<_DeleteObjectResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteObjectResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteObjectResponse&&(identical(other.httpStatusCode, httpStatusCode) || other.httpStatusCode == httpStatusCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,httpStatusCode);

@override
String toString() {
  return 'DeleteObjectResponse(httpStatusCode: $httpStatusCode)';
}


}

/// @nodoc
abstract mixin class _$DeleteObjectResponseCopyWith<$Res> implements $DeleteObjectResponseCopyWith<$Res> {
  factory _$DeleteObjectResponseCopyWith(_DeleteObjectResponse value, $Res Function(_DeleteObjectResponse) _then) = __$DeleteObjectResponseCopyWithImpl;
@override @useResult
$Res call({
 int? httpStatusCode
});




}
/// @nodoc
class __$DeleteObjectResponseCopyWithImpl<$Res>
    implements _$DeleteObjectResponseCopyWith<$Res> {
  __$DeleteObjectResponseCopyWithImpl(this._self, this._then);

  final _DeleteObjectResponse _self;
  final $Res Function(_DeleteObjectResponse) _then;

/// Create a copy of DeleteObjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? httpStatusCode = freezed,}) {
  return _then(_DeleteObjectResponse(
httpStatusCode: freezed == httpStatusCode ? _self.httpStatusCode : httpStatusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
