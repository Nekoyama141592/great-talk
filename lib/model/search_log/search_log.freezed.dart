// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SearchLog _$SearchLogFromJson(Map<String, dynamic> json) {
  return _UserUpdateLog.fromJson(json);
}

/// @nodoc
mixin _$SearchLog {
  dynamic get logCreatedAt;
  String get searchTarget;
  String get searchTerm;
  String get uid;

  /// Create a copy of SearchLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchLogCopyWith<SearchLog> get copyWith =>
      _$SearchLogCopyWithImpl<SearchLog>(this as SearchLog, _$identity);

  /// Serializes this SearchLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchLog &&
            const DeepCollectionEquality()
                .equals(other.logCreatedAt, logCreatedAt) &&
            (identical(other.searchTarget, searchTarget) ||
                other.searchTarget == searchTarget) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logCreatedAt),
      searchTarget,
      searchTerm,
      uid);

  @override
  String toString() {
    return 'SearchLog(logCreatedAt: $logCreatedAt, searchTarget: $searchTarget, searchTerm: $searchTerm, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class $SearchLogCopyWith<$Res> {
  factory $SearchLogCopyWith(SearchLog value, $Res Function(SearchLog) _then) =
      _$SearchLogCopyWithImpl;
  @useResult
  $Res call(
      {dynamic logCreatedAt,
      String searchTarget,
      String searchTerm,
      String uid});
}

/// @nodoc
class _$SearchLogCopyWithImpl<$Res> implements $SearchLogCopyWith<$Res> {
  _$SearchLogCopyWithImpl(this._self, this._then);

  final SearchLog _self;
  final $Res Function(SearchLog) _then;

  /// Create a copy of SearchLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchTarget = null,
    Object? searchTerm = null,
    Object? uid = null,
  }) {
    return _then(_self.copyWith(
      logCreatedAt: freezed == logCreatedAt
          ? _self.logCreatedAt
          : logCreatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchTarget: null == searchTarget
          ? _self.searchTarget
          : searchTarget // ignore: cast_nullable_to_non_nullable
              as String,
      searchTerm: null == searchTerm
          ? _self.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserUpdateLog implements SearchLog {
  const _UserUpdateLog(
      {required this.logCreatedAt,
      required this.searchTarget,
      required this.searchTerm,
      required this.uid});
  factory _UserUpdateLog.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateLogFromJson(json);

  @override
  final dynamic logCreatedAt;
  @override
  final String searchTarget;
  @override
  final String searchTerm;
  @override
  final String uid;

  /// Create a copy of SearchLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserUpdateLogCopyWith<_UserUpdateLog> get copyWith =>
      __$UserUpdateLogCopyWithImpl<_UserUpdateLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserUpdateLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserUpdateLog &&
            const DeepCollectionEquality()
                .equals(other.logCreatedAt, logCreatedAt) &&
            (identical(other.searchTarget, searchTarget) ||
                other.searchTarget == searchTarget) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logCreatedAt),
      searchTarget,
      searchTerm,
      uid);

  @override
  String toString() {
    return 'SearchLog(logCreatedAt: $logCreatedAt, searchTarget: $searchTarget, searchTerm: $searchTerm, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class _$UserUpdateLogCopyWith<$Res>
    implements $SearchLogCopyWith<$Res> {
  factory _$UserUpdateLogCopyWith(
          _UserUpdateLog value, $Res Function(_UserUpdateLog) _then) =
      __$UserUpdateLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {dynamic logCreatedAt,
      String searchTarget,
      String searchTerm,
      String uid});
}

/// @nodoc
class __$UserUpdateLogCopyWithImpl<$Res>
    implements _$UserUpdateLogCopyWith<$Res> {
  __$UserUpdateLogCopyWithImpl(this._self, this._then);

  final _UserUpdateLog _self;
  final $Res Function(_UserUpdateLog) _then;

  /// Create a copy of SearchLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? logCreatedAt = freezed,
    Object? searchTarget = null,
    Object? searchTerm = null,
    Object? uid = null,
  }) {
    return _then(_UserUpdateLog(
      logCreatedAt: freezed == logCreatedAt
          ? _self.logCreatedAt
          : logCreatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      searchTarget: null == searchTarget
          ? _self.searchTarget
          : searchTarget // ignore: cast_nullable_to_non_nullable
              as String,
      searchTerm: null == searchTerm
          ? _self.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
