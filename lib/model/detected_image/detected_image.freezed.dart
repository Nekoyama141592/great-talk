// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detected_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetectedImage {
  String get bucketName;
  List<Map<String, dynamic>> get moderationLabels;
  String get moderationModelVersion;
  String get value;

  /// Create a copy of DetectedImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetectedImageCopyWith<DetectedImage> get copyWith =>
      _$DetectedImageCopyWithImpl<DetectedImage>(
          this as DetectedImage, _$identity);

  /// Serializes this DetectedImage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetectedImage &&
            (identical(other.bucketName, bucketName) ||
                other.bucketName == bucketName) &&
            const DeepCollectionEquality()
                .equals(other.moderationLabels, moderationLabels) &&
            (identical(other.moderationModelVersion, moderationModelVersion) ||
                other.moderationModelVersion == moderationModelVersion) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bucketName,
      const DeepCollectionEquality().hash(moderationLabels),
      moderationModelVersion,
      value);

  @override
  String toString() {
    return 'DetectedImage(bucketName: $bucketName, moderationLabels: $moderationLabels, moderationModelVersion: $moderationModelVersion, value: $value)';
  }
}

/// @nodoc
abstract mixin class $DetectedImageCopyWith<$Res> {
  factory $DetectedImageCopyWith(
          DetectedImage value, $Res Function(DetectedImage) _then) =
      _$DetectedImageCopyWithImpl;
  @useResult
  $Res call(
      {String bucketName,
      List<Map<String, dynamic>> moderationLabels,
      String moderationModelVersion,
      String value});
}

/// @nodoc
class _$DetectedImageCopyWithImpl<$Res>
    implements $DetectedImageCopyWith<$Res> {
  _$DetectedImageCopyWithImpl(this._self, this._then);

  final DetectedImage _self;
  final $Res Function(DetectedImage) _then;

  /// Create a copy of DetectedImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bucketName = null,
    Object? moderationLabels = null,
    Object? moderationModelVersion = null,
    Object? value = null,
  }) {
    return _then(_self.copyWith(
      bucketName: null == bucketName
          ? _self.bucketName
          : bucketName // ignore: cast_nullable_to_non_nullable
              as String,
      moderationLabels: null == moderationLabels
          ? _self.moderationLabels
          : moderationLabels // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      moderationModelVersion: null == moderationModelVersion
          ? _self.moderationModelVersion
          : moderationModelVersion // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DetectedImage extends DetectedImage {
  const _DetectedImage(
      {this.bucketName = "",
      final List<Map<String, dynamic>> moderationLabels = const [],
      this.moderationModelVersion = "",
      this.value = ""})
      : _moderationLabels = moderationLabels,
        super._();
  factory _DetectedImage.fromJson(Map<String, dynamic> json) =>
      _$DetectedImageFromJson(json);

  @override
  @JsonKey()
  final String bucketName;
  final List<Map<String, dynamic>> _moderationLabels;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get moderationLabels {
    if (_moderationLabels is EqualUnmodifiableListView)
      return _moderationLabels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moderationLabels);
  }

  @override
  @JsonKey()
  final String moderationModelVersion;
  @override
  @JsonKey()
  final String value;

  /// Create a copy of DetectedImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetectedImageCopyWith<_DetectedImage> get copyWith =>
      __$DetectedImageCopyWithImpl<_DetectedImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DetectedImageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetectedImage &&
            (identical(other.bucketName, bucketName) ||
                other.bucketName == bucketName) &&
            const DeepCollectionEquality()
                .equals(other._moderationLabels, _moderationLabels) &&
            (identical(other.moderationModelVersion, moderationModelVersion) ||
                other.moderationModelVersion == moderationModelVersion) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bucketName,
      const DeepCollectionEquality().hash(_moderationLabels),
      moderationModelVersion,
      value);

  @override
  String toString() {
    return 'DetectedImage(bucketName: $bucketName, moderationLabels: $moderationLabels, moderationModelVersion: $moderationModelVersion, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$DetectedImageCopyWith<$Res>
    implements $DetectedImageCopyWith<$Res> {
  factory _$DetectedImageCopyWith(
          _DetectedImage value, $Res Function(_DetectedImage) _then) =
      __$DetectedImageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String bucketName,
      List<Map<String, dynamic>> moderationLabels,
      String moderationModelVersion,
      String value});
}

/// @nodoc
class __$DetectedImageCopyWithImpl<$Res>
    implements _$DetectedImageCopyWith<$Res> {
  __$DetectedImageCopyWithImpl(this._self, this._then);

  final _DetectedImage _self;
  final $Res Function(_DetectedImage) _then;

  /// Create a copy of DetectedImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bucketName = null,
    Object? moderationLabels = null,
    Object? moderationModelVersion = null,
    Object? value = null,
  }) {
    return _then(_DetectedImage(
      bucketName: null == bucketName
          ? _self.bucketName
          : bucketName // ignore: cast_nullable_to_non_nullable
              as String,
      moderationLabels: null == moderationLabels
          ? _self._moderationLabels
          : moderationLabels // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      moderationModelVersion: null == moderationModelVersion
          ? _self.moderationModelVersion
          : moderationModelVersion // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
