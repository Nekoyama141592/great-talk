// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderated_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModeratedImage {

 String get bucketName; List<Map<String, dynamic>> get moderationLabels; String get moderationModelVersion; String get value;
/// Create a copy of ModeratedImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<ModeratedImage> get copyWith => _$ModeratedImageCopyWithImpl<ModeratedImage>(this as ModeratedImage, _$identity);

  /// Serializes this ModeratedImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModeratedImage&&(identical(other.bucketName, bucketName) || other.bucketName == bucketName)&&const DeepCollectionEquality().equals(other.moderationLabels, moderationLabels)&&(identical(other.moderationModelVersion, moderationModelVersion) || other.moderationModelVersion == moderationModelVersion)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucketName,const DeepCollectionEquality().hash(moderationLabels),moderationModelVersion,value);

@override
String toString() {
  return 'ModeratedImage(bucketName: $bucketName, moderationLabels: $moderationLabels, moderationModelVersion: $moderationModelVersion, value: $value)';
}


}

/// @nodoc
abstract mixin class $ModeratedImageCopyWith<$Res>  {
  factory $ModeratedImageCopyWith(ModeratedImage value, $Res Function(ModeratedImage) _then) = _$ModeratedImageCopyWithImpl;
@useResult
$Res call({
 String bucketName, List<Map<String, dynamic>> moderationLabels, String moderationModelVersion, String value
});




}
/// @nodoc
class _$ModeratedImageCopyWithImpl<$Res>
    implements $ModeratedImageCopyWith<$Res> {
  _$ModeratedImageCopyWithImpl(this._self, this._then);

  final ModeratedImage _self;
  final $Res Function(ModeratedImage) _then;

/// Create a copy of ModeratedImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bucketName = null,Object? moderationLabels = null,Object? moderationModelVersion = null,Object? value = null,}) {
  return _then(_self.copyWith(
bucketName: null == bucketName ? _self.bucketName : bucketName // ignore: cast_nullable_to_non_nullable
as String,moderationLabels: null == moderationLabels ? _self.moderationLabels : moderationLabels // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,moderationModelVersion: null == moderationModelVersion ? _self.moderationModelVersion : moderationModelVersion // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ModeratedImage extends ModeratedImage {
  const _ModeratedImage({this.bucketName = "", final  List<Map<String, dynamic>> moderationLabels = const [], this.moderationModelVersion = "", this.value = ""}): _moderationLabels = moderationLabels,super._();
  factory _ModeratedImage.fromJson(Map<String, dynamic> json) => _$ModeratedImageFromJson(json);

@override@JsonKey() final  String bucketName;
 final  List<Map<String, dynamic>> _moderationLabels;
@override@JsonKey() List<Map<String, dynamic>> get moderationLabels {
  if (_moderationLabels is EqualUnmodifiableListView) return _moderationLabels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_moderationLabels);
}

@override@JsonKey() final  String moderationModelVersion;
@override@JsonKey() final  String value;

/// Create a copy of ModeratedImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModeratedImageCopyWith<_ModeratedImage> get copyWith => __$ModeratedImageCopyWithImpl<_ModeratedImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModeratedImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModeratedImage&&(identical(other.bucketName, bucketName) || other.bucketName == bucketName)&&const DeepCollectionEquality().equals(other._moderationLabels, _moderationLabels)&&(identical(other.moderationModelVersion, moderationModelVersion) || other.moderationModelVersion == moderationModelVersion)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucketName,const DeepCollectionEquality().hash(_moderationLabels),moderationModelVersion,value);

@override
String toString() {
  return 'ModeratedImage(bucketName: $bucketName, moderationLabels: $moderationLabels, moderationModelVersion: $moderationModelVersion, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ModeratedImageCopyWith<$Res> implements $ModeratedImageCopyWith<$Res> {
  factory _$ModeratedImageCopyWith(_ModeratedImage value, $Res Function(_ModeratedImage) _then) = __$ModeratedImageCopyWithImpl;
@override @useResult
$Res call({
 String bucketName, List<Map<String, dynamic>> moderationLabels, String moderationModelVersion, String value
});




}
/// @nodoc
class __$ModeratedImageCopyWithImpl<$Res>
    implements _$ModeratedImageCopyWith<$Res> {
  __$ModeratedImageCopyWithImpl(this._self, this._then);

  final _ModeratedImage _self;
  final $Res Function(_ModeratedImage) _then;

/// Create a copy of ModeratedImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bucketName = null,Object? moderationLabels = null,Object? moderationModelVersion = null,Object? value = null,}) {
  return _then(_ModeratedImage(
bucketName: null == bucketName ? _self.bucketName : bucketName // ignore: cast_nullable_to_non_nullable
as String,moderationLabels: null == moderationLabels ? _self._moderationLabels : moderationLabels // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,moderationModelVersion: null == moderationModelVersion ? _self.moderationModelVersion : moderationModelVersion // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
