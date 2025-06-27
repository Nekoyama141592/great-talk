// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_text_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateTextRequest {

 String get model; List<Map<String, dynamic>> get messages;
/// Create a copy of GenerateTextRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateTextRequestCopyWith<GenerateTextRequest> get copyWith => _$GenerateTextRequestCopyWithImpl<GenerateTextRequest>(this as GenerateTextRequest, _$identity);

  /// Serializes this GenerateTextRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateTextRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'GenerateTextRequest(model: $model, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $GenerateTextRequestCopyWith<$Res>  {
  factory $GenerateTextRequestCopyWith(GenerateTextRequest value, $Res Function(GenerateTextRequest) _then) = _$GenerateTextRequestCopyWithImpl;
@useResult
$Res call({
 String model, List<Map<String, dynamic>> messages
});




}
/// @nodoc
class _$GenerateTextRequestCopyWithImpl<$Res>
    implements $GenerateTextRequestCopyWith<$Res> {
  _$GenerateTextRequestCopyWithImpl(this._self, this._then);

  final GenerateTextRequest _self;
  final $Res Function(GenerateTextRequest) _then;

/// Create a copy of GenerateTextRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? messages = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenerateTextRequest implements GenerateTextRequest {
  const _GenerateTextRequest({required this.model, required final  List<Map<String, dynamic>> messages}): _messages = messages;
  factory _GenerateTextRequest.fromJson(Map<String, dynamic> json) => _$GenerateTextRequestFromJson(json);

@override final  String model;
 final  List<Map<String, dynamic>> _messages;
@override List<Map<String, dynamic>> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of GenerateTextRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateTextRequestCopyWith<_GenerateTextRequest> get copyWith => __$GenerateTextRequestCopyWithImpl<_GenerateTextRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateTextRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateTextRequest&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'GenerateTextRequest(model: $model, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$GenerateTextRequestCopyWith<$Res> implements $GenerateTextRequestCopyWith<$Res> {
  factory _$GenerateTextRequestCopyWith(_GenerateTextRequest value, $Res Function(_GenerateTextRequest) _then) = __$GenerateTextRequestCopyWithImpl;
@override @useResult
$Res call({
 String model, List<Map<String, dynamic>> messages
});




}
/// @nodoc
class __$GenerateTextRequestCopyWithImpl<$Res>
    implements _$GenerateTextRequestCopyWith<$Res> {
  __$GenerateTextRequestCopyWithImpl(this._self, this._then);

  final _GenerateTextRequest _self;
  final $Res Function(_GenerateTextRequest) _then;

/// Create a copy of GenerateTextRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? messages = null,}) {
  return _then(_GenerateTextRequest(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
