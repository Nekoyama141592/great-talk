// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditState {

 String get bio; String get userName; String? get base64; bool get isPicked;
/// Create a copy of EditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditStateCopyWith<EditState> get copyWith => _$EditStateCopyWithImpl<EditState>(this as EditState, _$identity);

  /// Serializes this EditState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditState&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.base64, base64) || other.base64 == base64)&&(identical(other.isPicked, isPicked) || other.isPicked == isPicked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio,userName,base64,isPicked);

@override
String toString() {
  return 'EditState(bio: $bio, userName: $userName, base64: $base64, isPicked: $isPicked)';
}


}

/// @nodoc
abstract mixin class $EditStateCopyWith<$Res>  {
  factory $EditStateCopyWith(EditState value, $Res Function(EditState) _then) = _$EditStateCopyWithImpl;
@useResult
$Res call({
 String bio, String userName, String? base64, bool isPicked
});




}
/// @nodoc
class _$EditStateCopyWithImpl<$Res>
    implements $EditStateCopyWith<$Res> {
  _$EditStateCopyWithImpl(this._self, this._then);

  final EditState _self;
  final $Res Function(EditState) _then;

/// Create a copy of EditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bio = null,Object? userName = null,Object? base64 = freezed,Object? isPicked = null,}) {
  return _then(_self.copyWith(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,isPicked: null == isPicked ? _self.isPicked : isPicked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EditState extends EditState {
  const _EditState({required this.bio, required this.userName, this.base64, this.isPicked = false}): super._();
  factory _EditState.fromJson(Map<String, dynamic> json) => _$EditStateFromJson(json);

@override final  String bio;
@override final  String userName;
@override final  String? base64;
@override@JsonKey() final  bool isPicked;

/// Create a copy of EditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditStateCopyWith<_EditState> get copyWith => __$EditStateCopyWithImpl<_EditState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditState&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.base64, base64) || other.base64 == base64)&&(identical(other.isPicked, isPicked) || other.isPicked == isPicked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio,userName,base64,isPicked);

@override
String toString() {
  return 'EditState(bio: $bio, userName: $userName, base64: $base64, isPicked: $isPicked)';
}


}

/// @nodoc
abstract mixin class _$EditStateCopyWith<$Res> implements $EditStateCopyWith<$Res> {
  factory _$EditStateCopyWith(_EditState value, $Res Function(_EditState) _then) = __$EditStateCopyWithImpl;
@override @useResult
$Res call({
 String bio, String userName, String? base64, bool isPicked
});




}
/// @nodoc
class __$EditStateCopyWithImpl<$Res>
    implements _$EditStateCopyWith<$Res> {
  __$EditStateCopyWithImpl(this._self, this._then);

  final _EditState _self;
  final $Res Function(_EditState) _then;

/// Create a copy of EditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bio = null,Object? userName = null,Object? base64 = freezed,Object? isPicked = null,}) {
  return _then(_EditState(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,isPicked: null == isPicked ? _self.isPicked : isPicked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
