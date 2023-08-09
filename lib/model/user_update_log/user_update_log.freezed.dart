// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserUpdateLog _$UserUpdateLogFromJson(Map<String, dynamic> json) {
  return _UserUpdateLog.fromJson(json);
}

/// @nodoc
mixin _$UserUpdateLog {
  dynamic get logCreatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get searchToken => throw _privateConstructorUsedError;
  String get stringBio => throw _privateConstructorUsedError;
  String get stringUserName => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get userImageFileName => throw _privateConstructorUsedError;
  dynamic get userRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUpdateLogCopyWith<UserUpdateLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUpdateLogCopyWith<$Res> {
  factory $UserUpdateLogCopyWith(
          UserUpdateLog value, $Res Function(UserUpdateLog) then) =
      _$UserUpdateLogCopyWithImpl<$Res, UserUpdateLog>;
  @useResult
  $Res call(
      {dynamic logCreatedAt,
      Map<String, dynamic> searchToken,
      String stringBio,
      String stringUserName,
      String uid,
      String userImageFileName,
      dynamic userRef});
}

/// @nodoc
class _$UserUpdateLogCopyWithImpl<$Res, $Val extends UserUpdateLog>
    implements $UserUpdateLogCopyWith<$Res> {
  _$UserUpdateLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchToken = null,
    Object? stringBio = null,
    Object? stringUserName = null,
    Object? uid = null,
    Object? userImageFileName = null,
    Object? userRef = freezed,
  }) {
    return _then(_value.copyWith(
      logCreatedAt: freezed == logCreatedAt
          ? _value.logCreatedAt
          : logCreatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchToken: null == searchToken
          ? _value.searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      stringBio: null == stringBio
          ? _value.stringBio
          : stringBio // ignore: cast_nullable_to_non_nullable
              as String,
      stringUserName: null == stringUserName
          ? _value.stringUserName
          : stringUserName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageFileName: null == userImageFileName
          ? _value.userImageFileName
          : userImageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      userRef: freezed == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserUpdateLogCopyWith<$Res>
    implements $UserUpdateLogCopyWith<$Res> {
  factory _$$_UserUpdateLogCopyWith(
          _$_UserUpdateLog value, $Res Function(_$_UserUpdateLog) then) =
      __$$_UserUpdateLogCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic logCreatedAt,
      Map<String, dynamic> searchToken,
      String stringBio,
      String stringUserName,
      String uid,
      String userImageFileName,
      dynamic userRef});
}

/// @nodoc
class __$$_UserUpdateLogCopyWithImpl<$Res>
    extends _$UserUpdateLogCopyWithImpl<$Res, _$_UserUpdateLog>
    implements _$$_UserUpdateLogCopyWith<$Res> {
  __$$_UserUpdateLogCopyWithImpl(
      _$_UserUpdateLog _value, $Res Function(_$_UserUpdateLog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchToken = null,
    Object? stringBio = null,
    Object? stringUserName = null,
    Object? uid = null,
    Object? userImageFileName = null,
    Object? userRef = freezed,
  }) {
    return _then(_$_UserUpdateLog(
      logCreatedAt: freezed == logCreatedAt
          ? _value.logCreatedAt
          : logCreatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchToken: null == searchToken
          ? _value._searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      stringBio: null == stringBio
          ? _value.stringBio
          : stringBio // ignore: cast_nullable_to_non_nullable
              as String,
      stringUserName: null == stringUserName
          ? _value.stringUserName
          : stringUserName // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageFileName: null == userImageFileName
          ? _value.userImageFileName
          : userImageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      userRef: freezed == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserUpdateLog implements _UserUpdateLog {
  const _$_UserUpdateLog(
      {required this.logCreatedAt,
      required final Map<String, dynamic> searchToken,
      required this.stringBio,
      required this.stringUserName,
      required this.uid,
      required this.userImageFileName,
      required this.userRef})
      : _searchToken = searchToken;

  factory _$_UserUpdateLog.fromJson(Map<String, dynamic> json) =>
      _$$_UserUpdateLogFromJson(json);

  @override
  final dynamic logCreatedAt;
  final Map<String, dynamic> _searchToken;
  @override
  Map<String, dynamic> get searchToken {
    if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchToken);
  }

  @override
  final String stringBio;
  @override
  final String stringUserName;
  @override
  final String uid;
  @override
  final String userImageFileName;
  @override
  final dynamic userRef;

  @override
  String toString() {
    return 'UserUpdateLog(logCreatedAt: $logCreatedAt, searchToken: $searchToken, stringBio: $stringBio, stringUserName: $stringUserName, uid: $uid, userImageFileName: $userImageFileName, userRef: $userRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserUpdateLog &&
            const DeepCollectionEquality()
                .equals(other.logCreatedAt, logCreatedAt) &&
            const DeepCollectionEquality()
                .equals(other._searchToken, _searchToken) &&
            (identical(other.stringBio, stringBio) ||
                other.stringBio == stringBio) &&
            (identical(other.stringUserName, stringUserName) ||
                other.stringUserName == stringUserName) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userImageFileName, userImageFileName) ||
                other.userImageFileName == userImageFileName) &&
            const DeepCollectionEquality().equals(other.userRef, userRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logCreatedAt),
      const DeepCollectionEquality().hash(_searchToken),
      stringBio,
      stringUserName,
      uid,
      userImageFileName,
      const DeepCollectionEquality().hash(userRef));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserUpdateLogCopyWith<_$_UserUpdateLog> get copyWith =>
      __$$_UserUpdateLogCopyWithImpl<_$_UserUpdateLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserUpdateLogToJson(
      this,
    );
  }
}

abstract class _UserUpdateLog implements UserUpdateLog {
  const factory _UserUpdateLog(
      {required final dynamic logCreatedAt,
      required final Map<String, dynamic> searchToken,
      required final String stringBio,
      required final String stringUserName,
      required final String uid,
      required final String userImageFileName,
      required final dynamic userRef}) = _$_UserUpdateLog;

  factory _UserUpdateLog.fromJson(Map<String, dynamic> json) =
      _$_UserUpdateLog.fromJson;

  @override
  dynamic get logCreatedAt;
  @override
  Map<String, dynamic> get searchToken;
  @override
  String get stringBio;
  @override
  String get stringUserName;
  @override
  String get uid;
  @override
  String get userImageFileName;
  @override
  dynamic get userRef;
  @override
  @JsonKey(ignore: true)
  _$$_UserUpdateLogCopyWith<_$_UserUpdateLog> get copyWith =>
      throw _privateConstructorUsedError;
}
