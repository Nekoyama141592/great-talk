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
  List<Map<String, dynamic>> get moderationLabels =>
      throw _privateConstructorUsedError;
  String get moderationModelVersion => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

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
      {List<Map<String, dynamic>> moderationLabels,
      String moderationModelVersion,
      String url});
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
    Object? moderationLabels = null,
    Object? moderationModelVersion = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      moderationLabels: null == moderationLabels
          ? _value.moderationLabels
          : moderationLabels // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      moderationModelVersion: null == moderationModelVersion
          ? _value.moderationModelVersion
          : moderationModelVersion // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetectedImageCopyWith<$Res>
    implements $DetectedImageCopyWith<$Res> {
  factory _$$_DetectedImageCopyWith(
          _$_DetectedImage value, $Res Function(_$_DetectedImage) then) =
      __$$_DetectedImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, dynamic>> moderationLabels,
      String moderationModelVersion,
      String url});
}

/// @nodoc
class __$$_DetectedImageCopyWithImpl<$Res>
    extends _$DetectedImageCopyWithImpl<$Res, _$_DetectedImage>
    implements _$$_DetectedImageCopyWith<$Res> {
  __$$_DetectedImageCopyWithImpl(
      _$_DetectedImage _value, $Res Function(_$_DetectedImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moderationLabels = null,
    Object? moderationModelVersion = null,
    Object? url = null,
  }) {
    return _then(_$_DetectedImage(
      moderationLabels: null == moderationLabels
          ? _value._moderationLabels
          : moderationLabels // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      moderationModelVersion: null == moderationModelVersion
          ? _value.moderationModelVersion
          : moderationModelVersion // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetectedImage implements _DetectedImage {
  const _$_DetectedImage(
      {required final List<Map<String, dynamic>> moderationLabels,
      required this.moderationModelVersion,
      required this.url})
      : _moderationLabels = moderationLabels;

  factory _$_DetectedImage.fromJson(Map<String, dynamic> json) =>
      _$$_DetectedImageFromJson(json);

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
  final String url;

  @override
  String toString() {
    return 'DetectedImage(moderationLabels: $moderationLabels, moderationModelVersion: $moderationModelVersion, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetectedImage &&
            const DeepCollectionEquality()
                .equals(other._moderationLabels, _moderationLabels) &&
            (identical(other.moderationModelVersion, moderationModelVersion) ||
                other.moderationModelVersion == moderationModelVersion) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_moderationLabels),
      moderationModelVersion,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetectedImageCopyWith<_$_DetectedImage> get copyWith =>
      __$$_DetectedImageCopyWithImpl<_$_DetectedImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetectedImageToJson(
      this,
    );
  }
}

abstract class _DetectedImage implements DetectedImage {
  const factory _DetectedImage(
      {required final List<Map<String, dynamic>> moderationLabels,
      required final String moderationModelVersion,
      required final String url}) = _$_DetectedImage;

  factory _DetectedImage.fromJson(Map<String, dynamic> json) =
      _$_DetectedImage.fromJson;

  @override
  List<Map<String, dynamic>> get moderationLabels;
  @override
  String get moderationModelVersion;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_DetectedImageCopyWith<_$_DetectedImage> get copyWith =>
      throw _privateConstructorUsedError;
}