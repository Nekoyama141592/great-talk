// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuteUsersState {

 List<ImageUser> get imageUsers;
/// Create a copy of MuteUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuteUsersStateCopyWith<MuteUsersState> get copyWith => _$MuteUsersStateCopyWithImpl<MuteUsersState>(this as MuteUsersState, _$identity);

  /// Serializes this MuteUsersState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteUsersState&&const DeepCollectionEquality().equals(other.imageUsers, imageUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageUsers));

@override
String toString() {
  return 'MuteUsersState(imageUsers: $imageUsers)';
}


}

/// @nodoc
abstract mixin class $MuteUsersStateCopyWith<$Res>  {
  factory $MuteUsersStateCopyWith(MuteUsersState value, $Res Function(MuteUsersState) _then) = _$MuteUsersStateCopyWithImpl;
@useResult
$Res call({
 List<ImageUser> imageUsers
});




}
/// @nodoc
class _$MuteUsersStateCopyWithImpl<$Res>
    implements $MuteUsersStateCopyWith<$Res> {
  _$MuteUsersStateCopyWithImpl(this._self, this._then);

  final MuteUsersState _self;
  final $Res Function(MuteUsersState) _then;

/// Create a copy of MuteUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUsers = null,}) {
  return _then(_self.copyWith(
imageUsers: null == imageUsers ? _self.imageUsers : imageUsers // ignore: cast_nullable_to_non_nullable
as List<ImageUser>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MuteUsersState extends MuteUsersState {
  const _MuteUsersState({required final  List<ImageUser> imageUsers}): _imageUsers = imageUsers,super._();
  factory _MuteUsersState.fromJson(Map<String, dynamic> json) => _$MuteUsersStateFromJson(json);

 final  List<ImageUser> _imageUsers;
@override List<ImageUser> get imageUsers {
  if (_imageUsers is EqualUnmodifiableListView) return _imageUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUsers);
}


/// Create a copy of MuteUsersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteUsersStateCopyWith<_MuteUsersState> get copyWith => __$MuteUsersStateCopyWithImpl<_MuteUsersState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuteUsersStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteUsersState&&const DeepCollectionEquality().equals(other._imageUsers, _imageUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_imageUsers));

@override
String toString() {
  return 'MuteUsersState(imageUsers: $imageUsers)';
}


}

/// @nodoc
abstract mixin class _$MuteUsersStateCopyWith<$Res> implements $MuteUsersStateCopyWith<$Res> {
  factory _$MuteUsersStateCopyWith(_MuteUsersState value, $Res Function(_MuteUsersState) _then) = __$MuteUsersStateCopyWithImpl;
@override @useResult
$Res call({
 List<ImageUser> imageUsers
});




}
/// @nodoc
class __$MuteUsersStateCopyWithImpl<$Res>
    implements _$MuteUsersStateCopyWith<$Res> {
  __$MuteUsersStateCopyWithImpl(this._self, this._then);

  final _MuteUsersState _self;
  final $Res Function(_MuteUsersState) _then;

/// Create a copy of MuteUsersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUsers = null,}) {
  return _then(_MuteUsersState(
imageUsers: null == imageUsers ? _self._imageUsers : imageUsers // ignore: cast_nullable_to_non_nullable
as List<ImageUser>,
  ));
}


}

// dart format on
