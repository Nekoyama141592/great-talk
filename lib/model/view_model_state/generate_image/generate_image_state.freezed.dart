// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateImageState {

 String get prompt; String get size; String? get base64;
/// Create a copy of GenerateImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateImageStateCopyWith<GenerateImageState> get copyWith => _$GenerateImageStateCopyWithImpl<GenerateImageState>(this as GenerateImageState, _$identity);

  /// Serializes this GenerateImageState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateImageState&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.size, size) || other.size == size)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prompt,size,base64);

@override
String toString() {
  return 'GenerateImageState(prompt: $prompt, size: $size, base64: $base64)';
}


}

/// @nodoc
abstract mixin class $GenerateImageStateCopyWith<$Res>  {
  factory $GenerateImageStateCopyWith(GenerateImageState value, $Res Function(GenerateImageState) _then) = _$GenerateImageStateCopyWithImpl;
@useResult
$Res call({
 String prompt, String size, String? base64
});




}
/// @nodoc
class _$GenerateImageStateCopyWithImpl<$Res>
    implements $GenerateImageStateCopyWith<$Res> {
  _$GenerateImageStateCopyWithImpl(this._self, this._then);

  final GenerateImageState _self;
  final $Res Function(GenerateImageState) _then;

/// Create a copy of GenerateImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prompt = null,Object? size = null,Object? base64 = freezed,}) {
  return _then(_self.copyWith(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenerateImageState extends GenerateImageState {
  const _GenerateImageState({this.prompt = '', this.size = '', this.base64}): super._();
  factory _GenerateImageState.fromJson(Map<String, dynamic> json) => _$GenerateImageStateFromJson(json);

@override@JsonKey() final  String prompt;
@override@JsonKey() final  String size;
@override final  String? base64;

/// Create a copy of GenerateImageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateImageStateCopyWith<_GenerateImageState> get copyWith => __$GenerateImageStateCopyWithImpl<_GenerateImageState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateImageStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateImageState&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.size, size) || other.size == size)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prompt,size,base64);

@override
String toString() {
  return 'GenerateImageState(prompt: $prompt, size: $size, base64: $base64)';
}


}

/// @nodoc
abstract mixin class _$GenerateImageStateCopyWith<$Res> implements $GenerateImageStateCopyWith<$Res> {
  factory _$GenerateImageStateCopyWith(_GenerateImageState value, $Res Function(_GenerateImageState) _then) = __$GenerateImageStateCopyWithImpl;
@override @useResult
$Res call({
 String prompt, String size, String? base64
});




}
/// @nodoc
class __$GenerateImageStateCopyWithImpl<$Res>
    implements _$GenerateImageStateCopyWith<$Res> {
  __$GenerateImageStateCopyWithImpl(this._self, this._then);

  final _GenerateImageState _self;
  final $Res Function(_GenerateImageState) _then;

/// Create a copy of GenerateImageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prompt = null,Object? size = null,Object? base64 = freezed,}) {
  return _then(_GenerateImageState(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
