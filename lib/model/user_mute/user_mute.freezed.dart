// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_mute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMute {
  String get activeUid;
  dynamic get activeUserRef;
  dynamic get createdAt;
  String get passiveUid;
  dynamic get passiveUserRef;

  /// Create a copy of UserMute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserMuteCopyWith<UserMute> get copyWith =>
      _$UserMuteCopyWithImpl<UserMute>(this as UserMute, _$identity);

  /// Serializes this UserMute to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserMute &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality()
                .equals(other.activeUserRef, activeUserRef) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality()
                .equals(other.passiveUserRef, passiveUserRef));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(activeUserRef),
      const DeepCollectionEquality().hash(createdAt),
      passiveUid,
      const DeepCollectionEquality().hash(passiveUserRef));

  @override
  String toString() {
    return 'UserMute(activeUid: $activeUid, activeUserRef: $activeUserRef, createdAt: $createdAt, passiveUid: $passiveUid, passiveUserRef: $passiveUserRef)';
  }
}

/// @nodoc
abstract mixin class $UserMuteCopyWith<$Res> {
  factory $UserMuteCopyWith(UserMute value, $Res Function(UserMute) _then) =
      _$UserMuteCopyWithImpl;
  @useResult
  $Res call(
      {String activeUid,
      dynamic activeUserRef,
      dynamic createdAt,
      String passiveUid,
      dynamic passiveUserRef});
}

/// @nodoc
class _$UserMuteCopyWithImpl<$Res> implements $UserMuteCopyWith<$Res> {
  _$UserMuteCopyWithImpl(this._self, this._then);

  final UserMute _self;
  final $Res Function(UserMute) _then;

  /// Create a copy of UserMute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? activeUserRef = freezed,
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? passiveUserRef = freezed,
  }) {
    return _then(_self.copyWith(
      activeUid: null == activeUid
          ? _self.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      activeUserRef: freezed == activeUserRef
          ? _self.activeUserRef
          : activeUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _self.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserRef: freezed == passiveUserRef
          ? _self.passiveUserRef
          : passiveUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserMute implements UserMute {
  const _UserMute(
      {required this.activeUid,
      required this.activeUserRef,
      required this.createdAt,
      required this.passiveUid,
      required this.passiveUserRef});
  factory _UserMute.fromJson(Map<String, dynamic> json) =>
      _$UserMuteFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic activeUserRef;
  @override
  final dynamic createdAt;
  @override
  final String passiveUid;
  @override
  final dynamic passiveUserRef;

  /// Create a copy of UserMute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserMuteCopyWith<_UserMute> get copyWith =>
      __$UserMuteCopyWithImpl<_UserMute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserMuteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserMute &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality()
                .equals(other.activeUserRef, activeUserRef) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality()
                .equals(other.passiveUserRef, passiveUserRef));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(activeUserRef),
      const DeepCollectionEquality().hash(createdAt),
      passiveUid,
      const DeepCollectionEquality().hash(passiveUserRef));

  @override
  String toString() {
    return 'UserMute(activeUid: $activeUid, activeUserRef: $activeUserRef, createdAt: $createdAt, passiveUid: $passiveUid, passiveUserRef: $passiveUserRef)';
  }
}

/// @nodoc
abstract mixin class _$UserMuteCopyWith<$Res>
    implements $UserMuteCopyWith<$Res> {
  factory _$UserMuteCopyWith(_UserMute value, $Res Function(_UserMute) _then) =
      __$UserMuteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic activeUserRef,
      dynamic createdAt,
      String passiveUid,
      dynamic passiveUserRef});
}

/// @nodoc
class __$UserMuteCopyWithImpl<$Res> implements _$UserMuteCopyWith<$Res> {
  __$UserMuteCopyWithImpl(this._self, this._then);

  final _UserMute _self;
  final $Res Function(_UserMute) _then;

  /// Create a copy of UserMute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeUid = null,
    Object? activeUserRef = freezed,
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? passiveUserRef = freezed,
  }) {
    return _then(_UserMute(
      activeUid: null == activeUid
          ? _self.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      activeUserRef: freezed == activeUserRef
          ? _self.activeUserRef
          : activeUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _self.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserRef: freezed == passiveUserRef
          ? _self.passiveUserRef
          : passiveUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
