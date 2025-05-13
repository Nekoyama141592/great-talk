// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_object_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteObjectResponse _$DeleteObjectResponseFromJson(Map<String, dynamic> json) {
  return _DeleteObjectResponse.fromJson(json);
}

/// @nodoc
mixin _$DeleteObjectResponse {
  String get base64Image => throw _privateConstructorUsedError;

  /// Serializes this DeleteObjectResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteObjectResponseCopyWith<DeleteObjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteObjectResponseCopyWith<$Res> {
  factory $DeleteObjectResponseCopyWith(DeleteObjectResponse value,
          $Res Function(DeleteObjectResponse) then) =
      _$DeleteObjectResponseCopyWithImpl<$Res, DeleteObjectResponse>;
  @useResult
  $Res call({String base64Image});
}

/// @nodoc
class _$DeleteObjectResponseCopyWithImpl<$Res,
        $Val extends DeleteObjectResponse>
    implements $DeleteObjectResponseCopyWith<$Res> {
  _$DeleteObjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteObjectResponse
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
abstract class _$$DeleteObjectResponseImplCopyWith<$Res>
    implements $DeleteObjectResponseCopyWith<$Res> {
  factory _$$DeleteObjectResponseImplCopyWith(_$DeleteObjectResponseImpl value,
          $Res Function(_$DeleteObjectResponseImpl) then) =
      __$$DeleteObjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String base64Image});
}

/// @nodoc
class __$$DeleteObjectResponseImplCopyWithImpl<$Res>
    extends _$DeleteObjectResponseCopyWithImpl<$Res, _$DeleteObjectResponseImpl>
    implements _$$DeleteObjectResponseImplCopyWith<$Res> {
  __$$DeleteObjectResponseImplCopyWithImpl(_$DeleteObjectResponseImpl _value,
      $Res Function(_$DeleteObjectResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = null,
  }) {
    return _then(_$DeleteObjectResponseImpl(
      base64Image: null == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteObjectResponseImpl extends _DeleteObjectResponse {
  const _$DeleteObjectResponseImpl({required this.base64Image}) : super._();

  factory _$DeleteObjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteObjectResponseImplFromJson(json);

  @override
  final String base64Image;

  @override
  String toString() {
    return 'DeleteObjectResponse(base64Image: $base64Image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteObjectResponseImpl &&
            (identical(other.base64Image, base64Image) ||
                other.base64Image == base64Image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, base64Image);

  /// Create a copy of DeleteObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteObjectResponseImplCopyWith<_$DeleteObjectResponseImpl>
      get copyWith =>
          __$$DeleteObjectResponseImplCopyWithImpl<_$DeleteObjectResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteObjectResponseImplToJson(
      this,
    );
  }
}

abstract class _DeleteObjectResponse extends DeleteObjectResponse {
  const factory _DeleteObjectResponse({required final String base64Image}) =
      _$DeleteObjectResponseImpl;
  const _DeleteObjectResponse._() : super._();

  factory _DeleteObjectResponse.fromJson(Map<String, dynamic> json) =
      _$DeleteObjectResponseImpl.fromJson;

  @override
  String get base64Image;

  /// Create a copy of DeleteObjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteObjectResponseImplCopyWith<_$DeleteObjectResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
