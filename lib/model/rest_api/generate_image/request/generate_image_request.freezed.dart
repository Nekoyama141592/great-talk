// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateImageRequest {
  String get prompt;
  String get size;

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerateImageRequestCopyWith<GenerateImageRequest> get copyWith =>
      _$GenerateImageRequestCopyWithImpl<GenerateImageRequest>(
          this as GenerateImageRequest, _$identity);

  /// Serializes this GenerateImageRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerateImageRequest &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prompt, size);

  @override
  String toString() {
    return 'GenerateImageRequest(prompt: $prompt, size: $size)';
  }
}

/// @nodoc
abstract mixin class $GenerateImageRequestCopyWith<$Res> {
  factory $GenerateImageRequestCopyWith(GenerateImageRequest value,
          $Res Function(GenerateImageRequest) _then) =
      _$GenerateImageRequestCopyWithImpl;
  @useResult
  $Res call({String prompt, String size});
}

/// @nodoc
class _$GenerateImageRequestCopyWithImpl<$Res>
    implements $GenerateImageRequestCopyWith<$Res> {
  _$GenerateImageRequestCopyWithImpl(this._self, this._then);

  final GenerateImageRequest _self;
  final $Res Function(GenerateImageRequest) _then;

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? size = null,
  }) {
    return _then(_self.copyWith(
      prompt: null == prompt
          ? _self.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GenerateImageRequest extends GenerateImageRequest {
  const _GenerateImageRequest({required this.prompt, required this.size})
      : super._();
  factory _GenerateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageRequestFromJson(json);

  @override
  final String prompt;
  @override
  final String size;

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerateImageRequestCopyWith<_GenerateImageRequest> get copyWith =>
      __$GenerateImageRequestCopyWithImpl<_GenerateImageRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenerateImageRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerateImageRequest &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prompt, size);

  @override
  String toString() {
    return 'GenerateImageRequest(prompt: $prompt, size: $size)';
  }
}

/// @nodoc
abstract mixin class _$GenerateImageRequestCopyWith<$Res>
    implements $GenerateImageRequestCopyWith<$Res> {
  factory _$GenerateImageRequestCopyWith(_GenerateImageRequest value,
          $Res Function(_GenerateImageRequest) _then) =
      __$GenerateImageRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String prompt, String size});
}

/// @nodoc
class __$GenerateImageRequestCopyWithImpl<$Res>
    implements _$GenerateImageRequestCopyWith<$Res> {
  __$GenerateImageRequestCopyWithImpl(this._self, this._then);

  final _GenerateImageRequest _self;
  final $Res Function(_GenerateImageRequest) _then;

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? prompt = null,
    Object? size = null,
  }) {
    return _then(_GenerateImageRequest(
      prompt: null == prompt
          ? _self.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
