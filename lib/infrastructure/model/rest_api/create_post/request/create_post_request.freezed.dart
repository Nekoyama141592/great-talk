// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePostRequest {

 String get title; String get description; String get base64Image; String get systemPrompt;
/// Create a copy of CreatePostRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePostRequestCopyWith<CreatePostRequest> get copyWith => _$CreatePostRequestCopyWithImpl<CreatePostRequest>(this as CreatePostRequest, _$identity);

  /// Serializes this CreatePostRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePostRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.base64Image, base64Image) || other.base64Image == base64Image)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,base64Image,systemPrompt);

@override
String toString() {
  return 'CreatePostRequest(title: $title, description: $description, base64Image: $base64Image, systemPrompt: $systemPrompt)';
}


}

/// @nodoc
abstract mixin class $CreatePostRequestCopyWith<$Res>  {
  factory $CreatePostRequestCopyWith(CreatePostRequest value, $Res Function(CreatePostRequest) _then) = _$CreatePostRequestCopyWithImpl;
@useResult
$Res call({
 String title, String description, String base64Image, String systemPrompt
});




}
/// @nodoc
class _$CreatePostRequestCopyWithImpl<$Res>
    implements $CreatePostRequestCopyWith<$Res> {
  _$CreatePostRequestCopyWithImpl(this._self, this._then);

  final CreatePostRequest _self;
  final $Res Function(CreatePostRequest) _then;

/// Create a copy of CreatePostRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? base64Image = null,Object? systemPrompt = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,base64Image: null == base64Image ? _self.base64Image : base64Image // ignore: cast_nullable_to_non_nullable
as String,systemPrompt: null == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CreatePostRequest extends CreatePostRequest {
  const _CreatePostRequest({required this.title, required this.description, required this.base64Image, required this.systemPrompt}): super._();
  factory _CreatePostRequest.fromJson(Map<String, dynamic> json) => _$CreatePostRequestFromJson(json);

@override final  String title;
@override final  String description;
@override final  String base64Image;
@override final  String systemPrompt;

/// Create a copy of CreatePostRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePostRequestCopyWith<_CreatePostRequest> get copyWith => __$CreatePostRequestCopyWithImpl<_CreatePostRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePostRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePostRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.base64Image, base64Image) || other.base64Image == base64Image)&&(identical(other.systemPrompt, systemPrompt) || other.systemPrompt == systemPrompt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,base64Image,systemPrompt);

@override
String toString() {
  return 'CreatePostRequest(title: $title, description: $description, base64Image: $base64Image, systemPrompt: $systemPrompt)';
}


}

/// @nodoc
abstract mixin class _$CreatePostRequestCopyWith<$Res> implements $CreatePostRequestCopyWith<$Res> {
  factory _$CreatePostRequestCopyWith(_CreatePostRequest value, $Res Function(_CreatePostRequest) _then) = __$CreatePostRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String base64Image, String systemPrompt
});




}
/// @nodoc
class __$CreatePostRequestCopyWithImpl<$Res>
    implements _$CreatePostRequestCopyWith<$Res> {
  __$CreatePostRequestCopyWithImpl(this._self, this._then);

  final _CreatePostRequest _self;
  final $Res Function(_CreatePostRequest) _then;

/// Create a copy of CreatePostRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? base64Image = null,Object? systemPrompt = null,}) {
  return _then(_CreatePostRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,base64Image: null == base64Image ? _self.base64Image : base64Image // ignore: cast_nullable_to_non_nullable
as String,systemPrompt: null == systemPrompt ? _self.systemPrompt : systemPrompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
