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

 String get model; String get prompt; int get n; String get size; String get user;
/// Create a copy of GenerateImageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateImageRequestCopyWith<GenerateImageRequest> get copyWith => _$GenerateImageRequestCopyWithImpl<GenerateImageRequest>(this as GenerateImageRequest, _$identity);

  /// Serializes this GenerateImageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateImageRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.n, n) || other.n == n)&&(identical(other.size, size) || other.size == size)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,prompt,n,size,user);

@override
String toString() {
  return 'GenerateImageRequest(model: $model, prompt: $prompt, n: $n, size: $size, user: $user)';
}


}

/// @nodoc
abstract mixin class $GenerateImageRequestCopyWith<$Res>  {
  factory $GenerateImageRequestCopyWith(GenerateImageRequest value, $Res Function(GenerateImageRequest) _then) = _$GenerateImageRequestCopyWithImpl;
@useResult
$Res call({
 String model, String prompt, int n, String size, String user
});




}
/// @nodoc
class _$GenerateImageRequestCopyWithImpl<$Res>
    implements $GenerateImageRequestCopyWith<$Res> {
  _$GenerateImageRequestCopyWithImpl(this._self, this._then);

  final GenerateImageRequest _self;
  final $Res Function(GenerateImageRequest) _then;

/// Create a copy of GenerateImageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? prompt = null,Object? n = null,Object? size = null,Object? user = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,n: null == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenerateImageRequest implements GenerateImageRequest {
  const _GenerateImageRequest({this.model = OpenAIConstants.imageModel, required this.prompt, this.n = 1, required this.size, required this.user});
  factory _GenerateImageRequest.fromJson(Map<String, dynamic> json) => _$GenerateImageRequestFromJson(json);

@override@JsonKey() final  String model;
@override final  String prompt;
@override@JsonKey() final  int n;
@override final  String size;
@override final  String user;

/// Create a copy of GenerateImageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateImageRequestCopyWith<_GenerateImageRequest> get copyWith => __$GenerateImageRequestCopyWithImpl<_GenerateImageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateImageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateImageRequest&&(identical(other.model, model) || other.model == model)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.n, n) || other.n == n)&&(identical(other.size, size) || other.size == size)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,prompt,n,size,user);

@override
String toString() {
  return 'GenerateImageRequest(model: $model, prompt: $prompt, n: $n, size: $size, user: $user)';
}


}

/// @nodoc
abstract mixin class _$GenerateImageRequestCopyWith<$Res> implements $GenerateImageRequestCopyWith<$Res> {
  factory _$GenerateImageRequestCopyWith(_GenerateImageRequest value, $Res Function(_GenerateImageRequest) _then) = __$GenerateImageRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, String prompt, int n, String size, String user
});




}
/// @nodoc
class __$GenerateImageRequestCopyWithImpl<$Res>
    implements _$GenerateImageRequestCopyWith<$Res> {
  __$GenerateImageRequestCopyWithImpl(this._self, this._then);

  final _GenerateImageRequest _self;
  final $Res Function(_GenerateImageRequest) _then;

/// Create a copy of GenerateImageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? prompt = null,Object? n = null,Object? size = null,Object? user = null,}) {
  return _then(_GenerateImageRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,n: null == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
