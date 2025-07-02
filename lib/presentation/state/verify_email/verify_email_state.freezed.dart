// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyEmailState {

 String get email; bool get canResend; int get resendSecondsLeft;
/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailStateCopyWith<VerifyEmailState> get copyWith => _$VerifyEmailStateCopyWithImpl<VerifyEmailState>(this as VerifyEmailState, _$identity);

  /// Serializes this VerifyEmailState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailState&&(identical(other.email, email) || other.email == email)&&(identical(other.canResend, canResend) || other.canResend == canResend)&&(identical(other.resendSecondsLeft, resendSecondsLeft) || other.resendSecondsLeft == resendSecondsLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,canResend,resendSecondsLeft);

@override
String toString() {
  return 'VerifyEmailState(email: $email, canResend: $canResend, resendSecondsLeft: $resendSecondsLeft)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailStateCopyWith<$Res>  {
  factory $VerifyEmailStateCopyWith(VerifyEmailState value, $Res Function(VerifyEmailState) _then) = _$VerifyEmailStateCopyWithImpl;
@useResult
$Res call({
 String email, bool canResend, int resendSecondsLeft
});




}
/// @nodoc
class _$VerifyEmailStateCopyWithImpl<$Res>
    implements $VerifyEmailStateCopyWith<$Res> {
  _$VerifyEmailStateCopyWithImpl(this._self, this._then);

  final VerifyEmailState _self;
  final $Res Function(VerifyEmailState) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? canResend = null,Object? resendSecondsLeft = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,resendSecondsLeft: null == resendSecondsLeft ? _self.resendSecondsLeft : resendSecondsLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VerifyEmailState extends VerifyEmailState {
  const _VerifyEmailState({required this.email, this.canResend = false, this.resendSecondsLeft = 60}): super._();
  factory _VerifyEmailState.fromJson(Map<String, dynamic> json) => _$VerifyEmailStateFromJson(json);

@override final  String email;
@override@JsonKey() final  bool canResend;
@override@JsonKey() final  int resendSecondsLeft;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyEmailStateCopyWith<_VerifyEmailState> get copyWith => __$VerifyEmailStateCopyWithImpl<_VerifyEmailState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyEmailStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyEmailState&&(identical(other.email, email) || other.email == email)&&(identical(other.canResend, canResend) || other.canResend == canResend)&&(identical(other.resendSecondsLeft, resendSecondsLeft) || other.resendSecondsLeft == resendSecondsLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,canResend,resendSecondsLeft);

@override
String toString() {
  return 'VerifyEmailState(email: $email, canResend: $canResend, resendSecondsLeft: $resendSecondsLeft)';
}


}

/// @nodoc
abstract mixin class _$VerifyEmailStateCopyWith<$Res> implements $VerifyEmailStateCopyWith<$Res> {
  factory _$VerifyEmailStateCopyWith(_VerifyEmailState value, $Res Function(_VerifyEmailState) _then) = __$VerifyEmailStateCopyWithImpl;
@override @useResult
$Res call({
 String email, bool canResend, int resendSecondsLeft
});




}
/// @nodoc
class __$VerifyEmailStateCopyWithImpl<$Res>
    implements _$VerifyEmailStateCopyWith<$Res> {
  __$VerifyEmailStateCopyWithImpl(this._self, this._then);

  final _VerifyEmailState _self;
  final $Res Function(_VerifyEmailState) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? canResend = null,Object? resendSecondsLeft = null,}) {
  return _then(_VerifyEmailState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,resendSecondsLeft: null == resendSecondsLeft ? _self.resendSecondsLeft : resendSecondsLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
