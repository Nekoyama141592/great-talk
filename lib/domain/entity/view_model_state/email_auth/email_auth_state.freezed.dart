// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailAuthState {

 bool get isSignUp; bool get isLoading;
/// Create a copy of EmailAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailAuthStateCopyWith<EmailAuthState> get copyWith => _$EmailAuthStateCopyWithImpl<EmailAuthState>(this as EmailAuthState, _$identity);

  /// Serializes this EmailAuthState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailAuthState&&(identical(other.isSignUp, isSignUp) || other.isSignUp == isSignUp)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSignUp,isLoading);

@override
String toString() {
  return 'EmailAuthState(isSignUp: $isSignUp, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $EmailAuthStateCopyWith<$Res>  {
  factory $EmailAuthStateCopyWith(EmailAuthState value, $Res Function(EmailAuthState) _then) = _$EmailAuthStateCopyWithImpl;
@useResult
$Res call({
 bool isSignUp, bool isLoading
});




}
/// @nodoc
class _$EmailAuthStateCopyWithImpl<$Res>
    implements $EmailAuthStateCopyWith<$Res> {
  _$EmailAuthStateCopyWithImpl(this._self, this._then);

  final EmailAuthState _self;
  final $Res Function(EmailAuthState) _then;

/// Create a copy of EmailAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSignUp = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
isSignUp: null == isSignUp ? _self.isSignUp : isSignUp // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EmailAuthState extends EmailAuthState {
  const _EmailAuthState({this.isSignUp = false, this.isLoading = false}): super._();
  factory _EmailAuthState.fromJson(Map<String, dynamic> json) => _$EmailAuthStateFromJson(json);

@override@JsonKey() final  bool isSignUp;
@override@JsonKey() final  bool isLoading;

/// Create a copy of EmailAuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailAuthStateCopyWith<_EmailAuthState> get copyWith => __$EmailAuthStateCopyWithImpl<_EmailAuthState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailAuthStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailAuthState&&(identical(other.isSignUp, isSignUp) || other.isSignUp == isSignUp)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSignUp,isLoading);

@override
String toString() {
  return 'EmailAuthState(isSignUp: $isSignUp, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$EmailAuthStateCopyWith<$Res> implements $EmailAuthStateCopyWith<$Res> {
  factory _$EmailAuthStateCopyWith(_EmailAuthState value, $Res Function(_EmailAuthState) _then) = __$EmailAuthStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSignUp, bool isLoading
});




}
/// @nodoc
class __$EmailAuthStateCopyWithImpl<$Res>
    implements _$EmailAuthStateCopyWith<$Res> {
  __$EmailAuthStateCopyWithImpl(this._self, this._then);

  final _EmailAuthState _self;
  final $Res Function(_EmailAuthState) _then;

/// Create a copy of EmailAuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSignUp = null,Object? isLoading = null,}) {
  return _then(_EmailAuthState(
isSignUp: null == isSignUp ? _self.isSignUp : isSignUp // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
