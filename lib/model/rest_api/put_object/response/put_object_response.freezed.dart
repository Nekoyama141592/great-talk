// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_object_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PutObjectResponse _$PutObjectResponseFromJson(Map<String, dynamic> json) {
  return _PutObjectResponse.fromJson(json);
}

/// @nodoc
mixin _$PutObjectResponse {
  String get base64Image => throw _privateConstructorUsedError;

  /// Serializes this PutObjectResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PutObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PutObjectResponseCopyWith<PutObjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PutObjectResponseCopyWith<$Res> {
  factory $PutObjectResponseCopyWith(
          PutObjectResponse value, $Res Function(PutObjectResponse) then) =
      _$PutObjectResponseCopyWithImpl<$Res, PutObjectResponse>;
  @useResult
  $Res call({String base64Image});
}

/// @nodoc
class _$PutObjectResponseCopyWithImpl<$Res, $Val extends PutObjectResponse>
    implements $PutObjectResponseCopyWith<$Res> {
  _$PutObjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PutObjectResponse
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
abstract class _$$PutObjectResponseImplCopyWith<$Res>
    implements $PutObjectResponseCopyWith<$Res> {
  factory _$$PutObjectResponseImplCopyWith(_$PutObjectResponseImpl value,
          $Res Function(_$PutObjectResponseImpl) then) =
      __$$PutObjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String base64Image});
}

/// @nodoc
class __$$PutObjectResponseImplCopyWithImpl<$Res>
    extends _$PutObjectResponseCopyWithImpl<$Res, _$PutObjectResponseImpl>
    implements _$$PutObjectResponseImplCopyWith<$Res> {
  __$$PutObjectResponseImplCopyWithImpl(_$PutObjectResponseImpl _value,
      $Res Function(_$PutObjectResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PutObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = null,
  }) {
    return _then(_$PutObjectResponseImpl(
      base64Image: null == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PutObjectResponseImpl extends _PutObjectResponse {
  const _$PutObjectResponseImpl({required this.base64Image}) : super._();

  factory _$PutObjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PutObjectResponseImplFromJson(json);

  @override
  final String base64Image;

  @override
  String toString() {
    return 'PutObjectResponse(base64Image: $base64Image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutObjectResponseImpl &&
            (identical(other.base64Image, base64Image) ||
                other.base64Image == base64Image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, base64Image);

  /// Create a copy of PutObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PutObjectResponseImplCopyWith<_$PutObjectResponseImpl> get copyWith =>
      __$$PutObjectResponseImplCopyWithImpl<_$PutObjectResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PutObjectResponseImplToJson(
      this,
    );
  }
}

abstract class _PutObjectResponse extends PutObjectResponse {
  const factory _PutObjectResponse({required final String base64Image}) =
      _$PutObjectResponseImpl;
  const _PutObjectResponse._() : super._();

  factory _PutObjectResponse.fromJson(Map<String, dynamic> json) =
      _$PutObjectResponseImpl.fromJson;

  @override
  String get base64Image;

  /// Create a copy of PutObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PutObjectResponseImplCopyWith<_$PutObjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
