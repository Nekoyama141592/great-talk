// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchLog _$SearchLogFromJson(Map<String, dynamic> json) {
  return _UserUpdateLog.fromJson(json);
}

/// @nodoc
mixin _$SearchLog {
  dynamic get logCreatedAt => throw _privateConstructorUsedError;
  String get searchTarget => throw _privateConstructorUsedError;
  String get searchTerm => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchLogCopyWith<SearchLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLogCopyWith<$Res> {
  factory $SearchLogCopyWith(SearchLog value, $Res Function(SearchLog) then) =
      _$SearchLogCopyWithImpl<$Res, SearchLog>;
  @useResult
  $Res call(
      {dynamic logCreatedAt,
      String searchTarget,
      String searchTerm,
      String uid});
}

/// @nodoc
class _$SearchLogCopyWithImpl<$Res, $Val extends SearchLog>
    implements $SearchLogCopyWith<$Res> {
  _$SearchLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchTarget = null,
    Object? searchTerm = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      logCreatedAt: freezed == logCreatedAt
          ? _value.logCreatedAt
          : logCreatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchTarget: null == searchTarget
          ? _value.searchTarget
          : searchTarget // ignore: cast_nullable_to_non_nullable
              as String,
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUpdateLogImplCopyWith<$Res>
    implements $SearchLogCopyWith<$Res> {
  factory _$$UserUpdateLogImplCopyWith(
          _$UserUpdateLogImpl value, $Res Function(_$UserUpdateLogImpl) then) =
      __$$UserUpdateLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic logCreatedAt,
      String searchTarget,
      String searchTerm,
      String uid});
}

/// @nodoc
class __$$UserUpdateLogImplCopyWithImpl<$Res>
    extends _$SearchLogCopyWithImpl<$Res, _$UserUpdateLogImpl>
    implements _$$UserUpdateLogImplCopyWith<$Res> {
  __$$UserUpdateLogImplCopyWithImpl(
      _$UserUpdateLogImpl _value, $Res Function(_$UserUpdateLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchTarget = null,
    Object? searchTerm = null,
    Object? uid = null,
  }) {
    return _then(_$UserUpdateLogImpl(
      logCreatedAt: freezed == logCreatedAt
          ? _value.logCreatedAt
          : logCreatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchTarget: null == searchTarget
          ? _value.searchTarget
          : searchTarget // ignore: cast_nullable_to_non_nullable
              as String,
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUpdateLogImpl implements _UserUpdateLog {
  const _$UserUpdateLogImpl(
      {required this.logCreatedAt,
      required this.searchTarget,
      required this.searchTerm,
      required this.uid});

  factory _$UserUpdateLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUpdateLogImplFromJson(json);

  @override
  final dynamic logCreatedAt;
  @override
  final String searchTarget;
  @override
  final String searchTerm;
  @override
  final String uid;

  @override
  String toString() {
    return 'SearchLog(logCreatedAt: $logCreatedAt, searchTarget: $searchTarget, searchTerm: $searchTerm, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateLogImpl &&
            const DeepCollectionEquality()
                .equals(other.logCreatedAt, logCreatedAt) &&
            (identical(other.searchTarget, searchTarget) ||
                other.searchTarget == searchTarget) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logCreatedAt),
      searchTarget,
      searchTerm,
      uid);

  @JsonKey(ignore: true)
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

abstract class _UserUpdateLog implements SearchLog {
  const factory _UserUpdateLog(
      {required final dynamic logCreatedAt,
      required final String searchTarget,
      required final String searchTerm,
      required final String uid}) = _$UserUpdateLogImpl;

  factory _UserUpdateLog.fromJson(Map<String, dynamic> json) =
      _$UserUpdateLogImpl.fromJson;

  @override
  dynamic get logCreatedAt;
  @override
  String get searchTarget;
  @override
  String get searchTerm;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$UserUpdateLogImplCopyWith<_$UserUpdateLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
