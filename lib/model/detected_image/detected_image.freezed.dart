// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detected_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetectedImage _$DetectedImageFromJson(Map<String, dynamic> json) {
  return _DetectedImage.fromJson(json);
}

/// @nodoc
mixin _$DetectedImage {
  String get bucketName => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get moderationLabels =>
      throw _privateConstructorUsedError;
  String get moderationModelVersion => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetectedImageCopyWith<DetectedImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectedImageCopyWith<$Res> {
  factory $DetectedImageCopyWith(
          DetectedImage value, $Res Function(DetectedImage) then) =
      _$DetectedImageCopyWithImpl<$Res, DetectedImage>;
  @useResult
  $Res call(
      {String bucketName,
      List<Map<String, dynamic>> moderationLabels,
      String moderationModelVersion,
      String value});
}

/// @nodoc
class _$DetectedImageCopyWithImpl<$Res, $Val extends DetectedImage>
    implements $DetectedImageCopyWith<$Res> {
  _$DetectedImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bucketName = null,
    Object? moderationLabels = null,
    Object? moderationModelVersion = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      bucketName: null == bucketName
          ? _value.bucketName
          : bucketName // ignore: cast_nullable_to_non_nullable
              as String,
      moderationLabels: null == moderationLabels
          ? _value.moderationLabels
          : moderationLabels // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      moderationModelVersion: null == moderationModelVersion
          ? _value.moderationModelVersion
          : moderationModelVersion // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetectedImageImplCopyWith<$Res>
    implements $DetectedImageCopyWith<$Res> {
  factory _$$DetectedImageImplCopyWith(
          _$DetectedImageImpl value, $Res Function(_$DetectedImageImpl) then) =
      __$$DetectedImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bucketName,
      List<Map<String, dynamic>> moderationLabels,
      String moderationModelVersion,
      String value});
}

/// @nodoc
class __$$DetectedImageImplCopyWithImpl<$Res>
    extends _$DetectedImageCopyWithImpl<$Res, _$DetectedImageImpl>
    implements _$$DetectedImageImplCopyWith<$Res> {
  __$$DetectedImageImplCopyWithImpl(
      _$DetectedImageImpl _value, $Res Function(_$DetectedImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bucketName = null,
    Object? moderationLabels = null,
    Object? moderationModelVersion = null,
    Object? value = null,
  }) {
    return _then(_$DetectedImageImpl(
      bucketName: null == bucketName
          ? _value.bucketName
          : bucketName // ignore: cast_nullable_to_non_nullable
              as String,
      moderationLabels: null == moderationLabels
          ? _value._moderationLabels
          : moderationLabels // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      moderationModelVersion: null == moderationModelVersion
          ? _value.moderationModelVersion
          : moderationModelVersion // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectedImageImpl extends _DetectedImage {
  const _$DetectedImageImpl(
      {required this.bucketName,
      required final List<Map<String, dynamic>> moderationLabels,
      required this.moderationModelVersion,
      required this.value})
      : _moderationLabels = moderationLabels,
        super._();

  factory _$DetectedImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectedImageImplFromJson(json);

  @override
  final String bucketName;
  final List<Map<String, dynamic>> _moderationLabels;
  @override
  List<Map<String, dynamic>> get moderationLabels {
    if (_moderationLabels is EqualUnmodifiableListView)
      return _moderationLabels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moderationLabels);
  }

  @override
  final String moderationModelVersion;
  @override
  final String value;

  @override
  String toString() {
    return 'DetectedImage(bucketName: $bucketName, moderationLabels: $moderationLabels, moderationModelVersion: $moderationModelVersion, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectedImageImpl &&
            (identical(other.bucketName, bucketName) ||
                other.bucketName == bucketName) &&
            const DeepCollectionEquality()
                .equals(other._moderationLabels, _moderationLabels) &&
            (identical(other.moderationModelVersion, moderationModelVersion) ||
                other.moderationModelVersion == moderationModelVersion) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bucketName,
      const DeepCollectionEquality().hash(_moderationLabels),
      moderationModelVersion,
      value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectedImageImplCopyWith<_$DetectedImageImpl> get copyWith =>
      __$$DetectedImageImplCopyWithImpl<_$DetectedImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectedImageImplToJson(
      this,
    );
  }
}

abstract class _DetectedImage extends DetectedImage {
  const factory _DetectedImage(
      {required final String bucketName,
      required final List<Map<String, dynamic>> moderationLabels,
      required final String moderationModelVersion,
      required final String value}) = _$DetectedImageImpl;
  const _DetectedImage._() : super._();

  factory _DetectedImage.fromJson(Map<String, dynamic> json) =
      _$DetectedImageImpl.fromJson;

  @override
  String get bucketName;
  @override
  List<Map<String, dynamic>> get moderationLabels;
  @override
  String get moderationModelVersion;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$DetectedImageImplCopyWith<_$DetectedImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
