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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenerateImageData _$GenerateImageDataFromJson(Map<String, dynamic> json) {
  return _GenerateImageData.fromJson(json);
}

/// @nodoc
mixin _$GenerateImageData {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_GenerateImageDataCopyWith<$Res>
    implements $GenerateImageDataCopyWith<$Res> {
  factory _$$_GenerateImageDataCopyWith(_$_GenerateImageData value,
          $Res Function(_$_GenerateImageData) then) =
      __$$_GenerateImageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_GenerateImageDataCopyWithImpl<$Res>
    extends _$GenerateImageDataCopyWithImpl<$Res, _$_GenerateImageData>
    implements _$$_GenerateImageDataCopyWith<$Res> {
  __$$_GenerateImageDataCopyWithImpl(
      _$_GenerateImageData _value, $Res Function(_$_GenerateImageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_GenerateImageData(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenerateImageData implements _GenerateImageData {
  const _$_GenerateImageData({required this.url});

  factory _$_GenerateImageData.fromJson(Map<String, dynamic> json) =>
      _$$_GenerateImageDataFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'GenerateImageData(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenerateImageData &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenerateImageDataCopyWith<_$_GenerateImageData> get copyWith =>
      __$$_GenerateImageDataCopyWithImpl<_$_GenerateImageData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenerateImageDataToJson(
      this,
    );
  }
}

abstract class _GenerateImageData implements GenerateImageData {
  const factory _GenerateImageData({required final String url}) =
      _$_GenerateImageData;

  factory _GenerateImageData.fromJson(Map<String, dynamic> json) =
      _$_GenerateImageData.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_GenerateImageDataCopyWith<_$_GenerateImageData> get copyWith =>
      throw _privateConstructorUsedError;
}
