// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateImageData {
  String get url;

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerateImageDataCopyWith<GenerateImageData> get copyWith =>
      _$GenerateImageDataCopyWithImpl<GenerateImageData>(
          this as GenerateImageData, _$identity);

  /// Serializes this GenerateImageData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerateImageData &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @override
  String toString() {
    return 'GenerateImageData(url: $url)';
  }
}

/// @nodoc
abstract mixin class $GenerateImageDataCopyWith<$Res> {
  factory $GenerateImageDataCopyWith(
          GenerateImageData value, $Res Function(GenerateImageData) _then) =
      _$GenerateImageDataCopyWithImpl;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$GenerateImageDataCopyWithImpl<$Res>
    implements $GenerateImageDataCopyWith<$Res> {
  _$GenerateImageDataCopyWithImpl(this._self, this._then);

  final GenerateImageData _self;
  final $Res Function(GenerateImageData) _then;

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GenerateImageData implements GenerateImageData {
  const _GenerateImageData({required this.url});
  factory _GenerateImageData.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageDataFromJson(json);

  @override
  final String url;

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerateImageDataCopyWith<_GenerateImageData> get copyWith =>
      __$GenerateImageDataCopyWithImpl<_GenerateImageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenerateImageDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerateImageData &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @override
  String toString() {
    return 'GenerateImageData(url: $url)';
  }
}

/// @nodoc
abstract mixin class _$GenerateImageDataCopyWith<$Res>
    implements $GenerateImageDataCopyWith<$Res> {
  factory _$GenerateImageDataCopyWith(
          _GenerateImageData value, $Res Function(_GenerateImageData) _then) =
      __$GenerateImageDataCopyWithImpl;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$GenerateImageDataCopyWithImpl<$Res>
    implements _$GenerateImageDataCopyWith<$Res> {
  __$GenerateImageDataCopyWithImpl(this._self, this._then);

  final _GenerateImageData _self;
  final $Res Function(_GenerateImageData) _then;

  /// Create a copy of GenerateImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
  }) {
    return _then(_GenerateImageData(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
