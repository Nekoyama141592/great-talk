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
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PutObjectResponseCopyWith<PutObjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PutObjectResponseCopyWith<$Res> {
  factory $PutObjectResponseCopyWith(
          PutObjectResponse value, $Res Function(PutObjectResponse) then) =
      _$PutObjectResponseCopyWithImpl<$Res, PutObjectResponse>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class _$PutObjectResponseCopyWithImpl<$Res, $Val extends PutObjectResponse>
    implements $PutObjectResponseCopyWith<$Res> {
  _$PutObjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
  $Res call({String image});
}

/// @nodoc
class __$$PutObjectResponseImplCopyWithImpl<$Res>
    extends _$PutObjectResponseCopyWithImpl<$Res, _$PutObjectResponseImpl>
    implements _$$PutObjectResponseImplCopyWith<$Res> {
  __$$PutObjectResponseImplCopyWithImpl(_$PutObjectResponseImpl _value,
      $Res Function(_$PutObjectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$PutObjectResponseImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PutObjectResponseImpl extends _PutObjectResponse {
  const _$PutObjectResponseImpl({required this.image}) : super._();

  factory _$PutObjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PutObjectResponseImplFromJson(json);

  @override
  final String image;

  @override
  String toString() {
    return 'PutObjectResponse(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutObjectResponseImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
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
  const factory _PutObjectResponse({required final String image}) =
      _$PutObjectResponseImpl;
  const _PutObjectResponse._() : super._();

  factory _PutObjectResponse.fromJson(Map<String, dynamic> json) =
      _$PutObjectResponseImpl.fromJson;

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$PutObjectResponseImplCopyWith<_$PutObjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
