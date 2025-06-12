// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfigState {

 String get maintenanceMsg; int get forcedUpdateVersion;
/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigStateCopyWith<RemoteConfigState> get copyWith => _$RemoteConfigStateCopyWithImpl<RemoteConfigState>(this as RemoteConfigState, _$identity);

  /// Serializes this RemoteConfigState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigState&&(identical(other.maintenanceMsg, maintenanceMsg) || other.maintenanceMsg == maintenanceMsg)&&(identical(other.forcedUpdateVersion, forcedUpdateVersion) || other.forcedUpdateVersion == forcedUpdateVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maintenanceMsg,forcedUpdateVersion);

@override
String toString() {
  return 'RemoteConfigState(maintenanceMsg: $maintenanceMsg, forcedUpdateVersion: $forcedUpdateVersion)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigStateCopyWith<$Res>  {
  factory $RemoteConfigStateCopyWith(RemoteConfigState value, $Res Function(RemoteConfigState) _then) = _$RemoteConfigStateCopyWithImpl;
@useResult
$Res call({
 String maintenanceMsg, int forcedUpdateVersion
});




}
/// @nodoc
class _$RemoteConfigStateCopyWithImpl<$Res>
    implements $RemoteConfigStateCopyWith<$Res> {
  _$RemoteConfigStateCopyWithImpl(this._self, this._then);

  final RemoteConfigState _self;
  final $Res Function(RemoteConfigState) _then;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maintenanceMsg = null,Object? forcedUpdateVersion = null,}) {
  return _then(_self.copyWith(
maintenanceMsg: null == maintenanceMsg ? _self.maintenanceMsg : maintenanceMsg // ignore: cast_nullable_to_non_nullable
as String,forcedUpdateVersion: null == forcedUpdateVersion ? _self.forcedUpdateVersion : forcedUpdateVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RemoteConfigState extends RemoteConfigState {
  const _RemoteConfigState({this.maintenanceMsg = '', this.forcedUpdateVersion = 0}): super._();
  factory _RemoteConfigState.fromJson(Map<String, dynamic> json) => _$RemoteConfigStateFromJson(json);

@override@JsonKey() final  String maintenanceMsg;
@override@JsonKey() final  int forcedUpdateVersion;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteConfigStateCopyWith<_RemoteConfigState> get copyWith => __$RemoteConfigStateCopyWithImpl<_RemoteConfigState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteConfigStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteConfigState&&(identical(other.maintenanceMsg, maintenanceMsg) || other.maintenanceMsg == maintenanceMsg)&&(identical(other.forcedUpdateVersion, forcedUpdateVersion) || other.forcedUpdateVersion == forcedUpdateVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maintenanceMsg,forcedUpdateVersion);

@override
String toString() {
  return 'RemoteConfigState(maintenanceMsg: $maintenanceMsg, forcedUpdateVersion: $forcedUpdateVersion)';
}


}

/// @nodoc
abstract mixin class _$RemoteConfigStateCopyWith<$Res> implements $RemoteConfigStateCopyWith<$Res> {
  factory _$RemoteConfigStateCopyWith(_RemoteConfigState value, $Res Function(_RemoteConfigState) _then) = __$RemoteConfigStateCopyWithImpl;
@override @useResult
$Res call({
 String maintenanceMsg, int forcedUpdateVersion
});




}
/// @nodoc
class __$RemoteConfigStateCopyWithImpl<$Res>
    implements _$RemoteConfigStateCopyWith<$Res> {
  __$RemoteConfigStateCopyWithImpl(this._self, this._then);

  final _RemoteConfigState _self;
  final $Res Function(_RemoteConfigState) _then;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maintenanceMsg = null,Object? forcedUpdateVersion = null,}) {
  return _then(_RemoteConfigState(
maintenanceMsg: null == maintenanceMsg ? _self.maintenanceMsg : maintenanceMsg // ignore: cast_nullable_to_non_nullable
as String,forcedUpdateVersion: null == forcedUpdateVersion ? _self.forcedUpdateVersion : forcedUpdateVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
