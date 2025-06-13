// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_text_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateTextResponse {

 String get model; String get content;
/// Create a copy of GenerateTextResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateTextResponseCopyWith<GenerateTextResponse> get copyWith => _$GenerateTextResponseCopyWithImpl<GenerateTextResponse>(this as GenerateTextResponse, _$identity);

  /// Serializes this GenerateTextResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateTextResponse&&(identical(other.model, model) || other.model == model)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,content);

@override
String toString() {
  return 'GenerateTextResponse(model: $model, content: $content)';
}


}

/// @nodoc
abstract mixin class $GenerateTextResponseCopyWith<$Res>  {
  factory $GenerateTextResponseCopyWith(GenerateTextResponse value, $Res Function(GenerateTextResponse) _then) = _$GenerateTextResponseCopyWithImpl;
@useResult
$Res call({
 String model, String content
});




}
/// @nodoc
class _$GenerateTextResponseCopyWithImpl<$Res>
    implements $GenerateTextResponseCopyWith<$Res> {
  _$GenerateTextResponseCopyWithImpl(this._self, this._then);

  final GenerateTextResponse _self;
  final $Res Function(GenerateTextResponse) _then;

/// Create a copy of GenerateTextResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? content = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenerateTextResponse implements GenerateTextResponse {
  const _GenerateTextResponse({required this.model, required this.content});
  factory _GenerateTextResponse.fromJson(Map<String, dynamic> json) => _$GenerateTextResponseFromJson(json);

@override final  String model;
@override final  String content;

/// Create a copy of GenerateTextResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateTextResponseCopyWith<_GenerateTextResponse> get copyWith => __$GenerateTextResponseCopyWithImpl<_GenerateTextResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateTextResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateTextResponse&&(identical(other.model, model) || other.model == model)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,content);

@override
String toString() {
  return 'GenerateTextResponse(model: $model, content: $content)';
}


}

/// @nodoc
abstract mixin class _$GenerateTextResponseCopyWith<$Res> implements $GenerateTextResponseCopyWith<$Res> {
  factory _$GenerateTextResponseCopyWith(_GenerateTextResponse value, $Res Function(_GenerateTextResponse) _then) = __$GenerateTextResponseCopyWithImpl;
@override @useResult
$Res call({
 String model, String content
});




}
/// @nodoc
class __$GenerateTextResponseCopyWithImpl<$Res>
    implements _$GenerateTextResponseCopyWith<$Res> {
  __$GenerateTextResponseCopyWithImpl(this._self, this._then);

  final _GenerateTextResponse _self;
  final $Res Function(_GenerateTextResponse) _then;

/// Create a copy of GenerateTextResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? content = null,}) {
  return _then(_GenerateTextResponse(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
