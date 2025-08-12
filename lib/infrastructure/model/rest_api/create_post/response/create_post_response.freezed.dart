// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePostResponse {

 String get postId; Map<String, dynamic> get moderatedImage; Map<String, dynamic> get detectedTitle; Map<String, dynamic> get detectedDescription;
/// Create a copy of CreatePostResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePostResponseCopyWith<CreatePostResponse> get copyWith => _$CreatePostResponseCopyWithImpl<CreatePostResponse>(this as CreatePostResponse, _$identity);

  /// Serializes this CreatePostResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePostResponse&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other.moderatedImage, moderatedImage)&&const DeepCollectionEquality().equals(other.detectedTitle, detectedTitle)&&const DeepCollectionEquality().equals(other.detectedDescription, detectedDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,const DeepCollectionEquality().hash(moderatedImage),const DeepCollectionEquality().hash(detectedTitle),const DeepCollectionEquality().hash(detectedDescription));

@override
String toString() {
  return 'CreatePostResponse(postId: $postId, moderatedImage: $moderatedImage, detectedTitle: $detectedTitle, detectedDescription: $detectedDescription)';
}


}

/// @nodoc
abstract mixin class $CreatePostResponseCopyWith<$Res>  {
  factory $CreatePostResponseCopyWith(CreatePostResponse value, $Res Function(CreatePostResponse) _then) = _$CreatePostResponseCopyWithImpl;
@useResult
$Res call({
 String postId, Map<String, dynamic> moderatedImage, Map<String, dynamic> detectedTitle, Map<String, dynamic> detectedDescription
});




}
/// @nodoc
class _$CreatePostResponseCopyWithImpl<$Res>
    implements $CreatePostResponseCopyWith<$Res> {
  _$CreatePostResponseCopyWithImpl(this._self, this._then);

  final CreatePostResponse _self;
  final $Res Function(CreatePostResponse) _then;

/// Create a copy of CreatePostResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,Object? moderatedImage = null,Object? detectedTitle = null,Object? detectedDescription = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,moderatedImage: null == moderatedImage ? _self.moderatedImage : moderatedImage // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,detectedTitle: null == detectedTitle ? _self.detectedTitle : detectedTitle // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,detectedDescription: null == detectedDescription ? _self.detectedDescription : detectedDescription // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CreatePostResponse extends CreatePostResponse {
  const _CreatePostResponse({required this.postId, required final  Map<String, dynamic> moderatedImage, required final  Map<String, dynamic> detectedTitle, required final  Map<String, dynamic> detectedDescription}): _moderatedImage = moderatedImage,_detectedTitle = detectedTitle,_detectedDescription = detectedDescription,super._();
  factory _CreatePostResponse.fromJson(Map<String, dynamic> json) => _$CreatePostResponseFromJson(json);

@override final  String postId;
 final  Map<String, dynamic> _moderatedImage;
@override Map<String, dynamic> get moderatedImage {
  if (_moderatedImage is EqualUnmodifiableMapView) return _moderatedImage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_moderatedImage);
}

 final  Map<String, dynamic> _detectedTitle;
@override Map<String, dynamic> get detectedTitle {
  if (_detectedTitle is EqualUnmodifiableMapView) return _detectedTitle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_detectedTitle);
}

 final  Map<String, dynamic> _detectedDescription;
@override Map<String, dynamic> get detectedDescription {
  if (_detectedDescription is EqualUnmodifiableMapView) return _detectedDescription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_detectedDescription);
}


/// Create a copy of CreatePostResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePostResponseCopyWith<_CreatePostResponse> get copyWith => __$CreatePostResponseCopyWithImpl<_CreatePostResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePostResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePostResponse&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other._moderatedImage, _moderatedImage)&&const DeepCollectionEquality().equals(other._detectedTitle, _detectedTitle)&&const DeepCollectionEquality().equals(other._detectedDescription, _detectedDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,const DeepCollectionEquality().hash(_moderatedImage),const DeepCollectionEquality().hash(_detectedTitle),const DeepCollectionEquality().hash(_detectedDescription));

@override
String toString() {
  return 'CreatePostResponse(postId: $postId, moderatedImage: $moderatedImage, detectedTitle: $detectedTitle, detectedDescription: $detectedDescription)';
}


}

/// @nodoc
abstract mixin class _$CreatePostResponseCopyWith<$Res> implements $CreatePostResponseCopyWith<$Res> {
  factory _$CreatePostResponseCopyWith(_CreatePostResponse value, $Res Function(_CreatePostResponse) _then) = __$CreatePostResponseCopyWithImpl;
@override @useResult
$Res call({
 String postId, Map<String, dynamic> moderatedImage, Map<String, dynamic> detectedTitle, Map<String, dynamic> detectedDescription
});




}
/// @nodoc
class __$CreatePostResponseCopyWithImpl<$Res>
    implements _$CreatePostResponseCopyWith<$Res> {
  __$CreatePostResponseCopyWithImpl(this._self, this._then);

  final _CreatePostResponse _self;
  final $Res Function(_CreatePostResponse) _then;

/// Create a copy of CreatePostResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? moderatedImage = null,Object? detectedTitle = null,Object? detectedDescription = null,}) {
  return _then(_CreatePostResponse(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,moderatedImage: null == moderatedImage ? _self._moderatedImage : moderatedImage // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,detectedTitle: null == detectedTitle ? _self._detectedTitle : detectedTitle // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,detectedDescription: null == detectedDescription ? _self._detectedDescription : detectedDescription // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
