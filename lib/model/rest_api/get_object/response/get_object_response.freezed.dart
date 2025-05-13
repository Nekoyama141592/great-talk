// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_object_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetObjectResponse _$GetObjectResponseFromJson(Map<String, dynamic> json) {
  return _GetObjectResponse.fromJson(json);
}

/// @nodoc
mixin _$GetObjectResponse {
  String get base64Image => throw _privateConstructorUsedError;

  /// Serializes this GetObjectResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetObjectResponseCopyWith<GetObjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetObjectResponseCopyWith<$Res> {
  factory $GetObjectResponseCopyWith(
          GetObjectResponse value, $Res Function(GetObjectResponse) then) =
      _$GetObjectResponseCopyWithImpl<$Res, GetObjectResponse>;
  @useResult
  $Res call({String base64Image});
}

/// @nodoc
class _$GetObjectResponseCopyWithImpl<$Res, $Val extends GetObjectResponse>
    implements $GetObjectResponseCopyWith<$Res> {
  _$GetObjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = null,
  }) {
    return _then(_value.copyWith(
      base64Image: null == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetObjectResponseImplCopyWith<$Res>
    implements $GetObjectResponseCopyWith<$Res> {
  factory _$$GetObjectResponseImplCopyWith(_$GetObjectResponseImpl value,
          $Res Function(_$GetObjectResponseImpl) then) =
      __$$GetObjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String base64Image});
}

/// @nodoc
class __$$GetObjectResponseImplCopyWithImpl<$Res>
    extends _$GetObjectResponseCopyWithImpl<$Res, _$GetObjectResponseImpl>
    implements _$$GetObjectResponseImplCopyWith<$Res> {
  __$$GetObjectResponseImplCopyWithImpl(_$GetObjectResponseImpl _value,
      $Res Function(_$GetObjectResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = null,
  }) {
    return _then(_$GetObjectResponseImpl(
      base64Image: null == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetObjectResponseImpl extends _GetObjectResponse {
  const _$GetObjectResponseImpl({required this.base64Image}) : super._();

  factory _$GetObjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetObjectResponseImplFromJson(json);

  @override
  final String base64Image;

  @override
  String toString() {
    return 'GetObjectResponse(base64Image: $base64Image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetObjectResponseImpl &&
            (identical(other.base64Image, base64Image) ||
                other.base64Image == base64Image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, base64Image);

  /// Create a copy of GetObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetObjectResponseImplCopyWith<_$GetObjectResponseImpl> get copyWith =>
      __$$GetObjectResponseImplCopyWithImpl<_$GetObjectResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetObjectResponseImplToJson(
      this,
    );
  }
}

abstract class _GetObjectResponse extends GetObjectResponse {
  const factory _GetObjectResponse({required final String base64Image}) =
      _$GetObjectResponseImpl;
  const _GetObjectResponse._() : super._();

  factory _GetObjectResponse.fromJson(Map<String, dynamic> json) =
      _$GetObjectResponseImpl.fromJson;

  @override
  String get base64Image;

  /// Create a copy of GetObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetObjectResponseImplCopyWith<_$GetObjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
