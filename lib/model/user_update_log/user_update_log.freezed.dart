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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  Map<String, dynamic> get image => throw _privateConstructorUsedError;
  dynamic get userRef => throw _privateConstructorUsedError;

  /// Serializes this UserUpdateLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserUpdateLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      Map<String, dynamic> image,
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

  /// Create a copy of UserUpdateLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchToken = null,
    Object? stringBio = null,
    Object? stringUserName = null,
    Object? uid = null,
    Object? image = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userRef: freezed == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUpdateLogImplCopyWith<$Res>
    implements $UserUpdateLogCopyWith<$Res> {
  factory _$$UserUpdateLogImplCopyWith(
          _$UserUpdateLogImpl value, $Res Function(_$UserUpdateLogImpl) then) =
      __$$UserUpdateLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic logCreatedAt,
      Map<String, dynamic> searchToken,
      String stringBio,
      String stringUserName,
      String uid,
      Map<String, dynamic> image,
      dynamic userRef});
}

/// @nodoc
class __$$UserUpdateLogImplCopyWithImpl<$Res>
    extends _$UserUpdateLogCopyWithImpl<$Res, _$UserUpdateLogImpl>
    implements _$$UserUpdateLogImplCopyWith<$Res> {
  __$$UserUpdateLogImplCopyWithImpl(
      _$UserUpdateLogImpl _value, $Res Function(_$UserUpdateLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserUpdateLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchToken = null,
    Object? stringBio = null,
    Object? stringUserName = null,
    Object? uid = null,
    Object? image = null,
    Object? userRef = freezed,
  }) {
    return _then(_$UserUpdateLogImpl(
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
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userRef: freezed == userRef
          ? _value.userRef
          : userRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUpdateLogImpl implements _UserUpdateLog {
  const _$UserUpdateLogImpl(
      {required this.logCreatedAt,
      required final Map<String, dynamic> searchToken,
      required this.stringBio,
      required this.stringUserName,
      required this.uid,
      required final Map<String, dynamic> image,
      required this.userRef})
      : _searchToken = searchToken,
        _image = image;

  factory _$UserUpdateLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUpdateLogImplFromJson(json);

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
  final Map<String, dynamic> _image;
  @override
  Map<String, dynamic> get image {
    if (_image is EqualUnmodifiableMapView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_image);
  }

  @override
  final dynamic userRef;

  @override
  String toString() {
    return 'UserUpdateLog(logCreatedAt: $logCreatedAt, searchToken: $searchToken, stringBio: $stringBio, stringUserName: $stringUserName, uid: $uid, image: $image, userRef: $userRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateLogImpl &&
            const DeepCollectionEquality()
                .equals(other.logCreatedAt, logCreatedAt) &&
            const DeepCollectionEquality()
                .equals(other._searchToken, _searchToken) &&
            (identical(other.stringBio, stringBio) ||
                other.stringBio == stringBio) &&
            (identical(other.stringUserName, stringUserName) ||
                other.stringUserName == stringUserName) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other.userRef, userRef));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logCreatedAt),
      const DeepCollectionEquality().hash(_searchToken),
      stringBio,
      stringUserName,
      uid,
      const DeepCollectionEquality().hash(_image),
      const DeepCollectionEquality().hash(userRef));

  /// Create a copy of UserUpdateLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateLogImplCopyWith<_$UserUpdateLogImpl> get copyWith =>
      __$$UserUpdateLogImplCopyWithImpl<_$UserUpdateLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUpdateLogImplToJson(
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
      required final Map<String, dynamic> image,
      required final dynamic userRef}) = _$UserUpdateLogImpl;

  factory _UserUpdateLog.fromJson(Map<String, dynamic> json) =
      _$UserUpdateLogImpl.fromJson;

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
  Map<String, dynamic> get image;
  @override
  dynamic get userRef;

  /// Create a copy of UserUpdateLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserUpdateLogImplCopyWith<_$UserUpdateLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
