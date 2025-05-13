// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateImageData _$GenerateImageDataFromJson(Map<String, dynamic> json) {
  return _GenerateImageData.fromJson(json);
}

/// @nodoc
mixin _$GenerateImageData {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this GenerateImageData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateImageDataCopyWith<GenerateImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateImageDataCopyWith<$Res> {
  factory $GenerateImageDataCopyWith(
          GenerateImageData value, $Res Function(GenerateImageData) then) =
      _$GenerateImageDataCopyWithImpl<$Res, GenerateImageData>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$GenerateImageDataCopyWithImpl<$Res, $Val extends GenerateImageData>
    implements $GenerateImageDataCopyWith<$Res> {
  _$GenerateImageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateImageDataImplCopyWith<$Res>
    implements $GenerateImageDataCopyWith<$Res> {
  factory _$$GenerateImageDataImplCopyWith(_$GenerateImageDataImpl value,
          $Res Function(_$GenerateImageDataImpl) then) =
      __$$GenerateImageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$GenerateImageDataImplCopyWithImpl<$Res>
    extends _$GenerateImageDataCopyWithImpl<$Res, _$GenerateImageDataImpl>
    implements _$$GenerateImageDataImplCopyWith<$Res> {
  __$$GenerateImageDataImplCopyWithImpl(_$GenerateImageDataImpl _value,
      $Res Function(_$GenerateImageDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$GenerateImageDataImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateImageDataImpl implements _GenerateImageData {
  const _$GenerateImageDataImpl({required this.url});

  factory _$GenerateImageDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateImageDataImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'GenerateImageData(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateImageDataImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateImageDataImplCopyWith<_$GenerateImageDataImpl> get copyWith =>
      __$$GenerateImageDataImplCopyWithImpl<_$GenerateImageDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateImageDataImplToJson(
      this,
    );
  }
}

abstract class _GenerateImageData implements GenerateImageData {
  const factory _GenerateImageData({required final String url}) =
      _$GenerateImageDataImpl;

  factory _GenerateImageData.fromJson(Map<String, dynamic> json) =
      _$GenerateImageDataImpl.fromJson;

  @override
  String get url;

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateImageDataImplCopyWith<_$GenerateImageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
