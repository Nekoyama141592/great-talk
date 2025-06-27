// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RankingUsersState _$RankingUsersStateFromJson(
  Map<String, dynamic> json
) {
    return _ImageUser.fromJson(
      json
    );
}

/// @nodoc
mixin _$RankingUsersState {

 List<ImageUser> get imageUsers;
/// Create a copy of RankingUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RankingUsersStateCopyWith<RankingUsersState> get copyWith => _$RankingUsersStateCopyWithImpl<RankingUsersState>(this as RankingUsersState, _$identity);

  /// Serializes this RankingUsersState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RankingUsersState&&const DeepCollectionEquality().equals(other.imageUsers, imageUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageUsers));

@override
String toString() {
  return 'RankingUsersState(imageUsers: $imageUsers)';
}


}

/// @nodoc
abstract mixin class $RankingUsersStateCopyWith<$Res>  {
  factory $RankingUsersStateCopyWith(RankingUsersState value, $Res Function(RankingUsersState) _then) = _$RankingUsersStateCopyWithImpl;
@useResult
$Res call({
 List<ImageUser> imageUsers
});




}
/// @nodoc
class _$RankingUsersStateCopyWithImpl<$Res>
    implements $RankingUsersStateCopyWith<$Res> {
  _$RankingUsersStateCopyWithImpl(this._self, this._then);

  final RankingUsersState _self;
  final $Res Function(RankingUsersState) _then;

/// Create a copy of RankingUsersState
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

class _ImageUser extends RankingUsersState {
  const _ImageUser({required final  List<ImageUser> imageUsers}): _imageUsers = imageUsers,super._();
  factory _ImageUser.fromJson(Map<String, dynamic> json) => _$ImageUserFromJson(json);

 final  List<ImageUser> _imageUsers;
@override List<ImageUser> get imageUsers {
  if (_imageUsers is EqualUnmodifiableListView) return _imageUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUsers);
}


/// Create a copy of RankingUsersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageUserCopyWith<_ImageUser> get copyWith => __$ImageUserCopyWithImpl<_ImageUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageUser&&const DeepCollectionEquality().equals(other._imageUsers, _imageUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_imageUsers));

@override
String toString() {
  return 'RankingUsersState(imageUsers: $imageUsers)';
}


}

/// @nodoc
abstract mixin class _$ImageUserCopyWith<$Res> implements $RankingUsersStateCopyWith<$Res> {
  factory _$ImageUserCopyWith(_ImageUser value, $Res Function(_ImageUser) _then) = __$ImageUserCopyWithImpl;
@override @useResult
$Res call({
 List<ImageUser> imageUsers
});




}
/// @nodoc
class __$ImageUserCopyWithImpl<$Res>
    implements _$ImageUserCopyWith<$Res> {
  __$ImageUserCopyWithImpl(this._self, this._then);

  final _ImageUser _self;
  final $Res Function(_ImageUser) _then;

/// Create a copy of RankingUsersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUsers = null,}) {
  return _then(_ImageUser(
imageUsers: null == imageUsers ? _self._imageUsers : imageUsers // ignore: cast_nullable_to_non_nullable
as List<ImageUser>,
  ));
}


}

// dart format on
