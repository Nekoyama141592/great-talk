// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminState {
  int get userCount;
  int get postCount;
  int get messageCount;
  int get searchCount;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminStateCopyWith<AdminState> get copyWith =>
      _$AdminStateCopyWithImpl<AdminState>(this as AdminState, _$identity);

  /// Serializes this AdminState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminState &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.searchCount, searchCount) ||
                other.searchCount == searchCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userCount, postCount, messageCount, searchCount);

  @override
  String toString() {
    return 'AdminState(userCount: $userCount, postCount: $postCount, messageCount: $messageCount, searchCount: $searchCount)';
  }
}

/// @nodoc
abstract mixin class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) _then) =
      _$AdminStateCopyWithImpl;
  @useResult
  $Res call({int userCount, int postCount, int messageCount, int searchCount});
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res> implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._self, this._then);

  final AdminState _self;
  final $Res Function(AdminState) _then;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCount = null,
    Object? postCount = null,
    Object? messageCount = null,
    Object? searchCount = null,
  }) {
    return _then(_self.copyWith(
      userCount: null == userCount
          ? _self.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _self.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      searchCount: null == searchCount
          ? _self.searchCount
          : searchCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AdminState implements AdminState {
  const _AdminState(
      {required this.userCount,
      required this.postCount,
      required this.messageCount,
      required this.searchCount});
  factory _AdminState.fromJson(Map<String, dynamic> json) =>
      _$AdminStateFromJson(json);

  @override
  final int userCount;
  @override
  final int postCount;
  @override
  final int messageCount;
  @override
  final int searchCount;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminStateCopyWith<_AdminState> get copyWith =>
      __$AdminStateCopyWithImpl<_AdminState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminState &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.searchCount, searchCount) ||
                other.searchCount == searchCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userCount, postCount, messageCount, searchCount);

  @override
  String toString() {
    return 'AdminState(userCount: $userCount, postCount: $postCount, messageCount: $messageCount, searchCount: $searchCount)';
  }
}

/// @nodoc
abstract mixin class _$AdminStateCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$AdminStateCopyWith(
          _AdminState value, $Res Function(_AdminState) _then) =
      __$AdminStateCopyWithImpl;
  @override
  @useResult
  $Res call({int userCount, int postCount, int messageCount, int searchCount});
}

/// @nodoc
class __$AdminStateCopyWithImpl<$Res> implements _$AdminStateCopyWith<$Res> {
  __$AdminStateCopyWithImpl(this._self, this._then);

  final _AdminState _self;
  final $Res Function(_AdminState) _then;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userCount = null,
    Object? postCount = null,
    Object? messageCount = null,
    Object? searchCount = null,
  }) {
    return _then(_AdminState(
      userCount: null == userCount
          ? _self.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _self.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      messageCount: null == messageCount
          ? _self.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      searchCount: null == searchCount
          ? _self.searchCount
          : searchCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
