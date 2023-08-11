// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostReport _$PostReportFromJson(Map<String, dynamic> json) {
  return _PostReport.fromJson(json);
}

/// @nodoc
mixin _$PostReport {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get activeUserRef => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get others => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;
  List<String> get reportContents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostReportCopyWith<PostReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostReportCopyWith<$Res> {
  factory $PostReportCopyWith(
          PostReport value, $Res Function(PostReport) then) =
      _$PostReportCopyWithImpl<$Res, PostReport>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic activeUserRef,
      dynamic createdAt,
      String others,
      dynamic postRef,
      List<String> reportContents});
}

/// @nodoc
class _$PostReportCopyWithImpl<$Res, $Val extends PostReport>
    implements $PostReportCopyWith<$Res> {
  _$PostReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? activeUserRef = freezed,
    Object? createdAt = freezed,
    Object? others = null,
    Object? postRef = freezed,
    Object? reportContents = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      activeUserRef: freezed == activeUserRef
          ? _value.activeUserRef
          : activeUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reportContents: null == reportContents
          ? _value.reportContents
          : reportContents // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostReportCopyWith<$Res>
    implements $PostReportCopyWith<$Res> {
  factory _$$_PostReportCopyWith(
          _$_PostReport value, $Res Function(_$_PostReport) then) =
      __$$_PostReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic activeUserRef,
      dynamic createdAt,
      String others,
      dynamic postRef,
      List<String> reportContents});
}

/// @nodoc
class __$$_PostReportCopyWithImpl<$Res>
    extends _$PostReportCopyWithImpl<$Res, _$_PostReport>
    implements _$$_PostReportCopyWith<$Res> {
  __$$_PostReportCopyWithImpl(
      _$_PostReport _value, $Res Function(_$_PostReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? activeUserRef = freezed,
    Object? createdAt = freezed,
    Object? others = null,
    Object? postRef = freezed,
    Object? reportContents = null,
  }) {
    return _then(_$_PostReport(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      activeUserRef: freezed == activeUserRef
          ? _value.activeUserRef
          : activeUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reportContents: null == reportContents
          ? _value._reportContents
          : reportContents // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostReport implements _PostReport {
  const _$_PostReport(
      {required this.activeUid,
      required this.activeUserRef,
      required this.createdAt,
      required this.others,
      required this.postRef,
      required final List<String> reportContents})
      : _reportContents = reportContents;

  factory _$_PostReport.fromJson(Map<String, dynamic> json) =>
      _$$_PostReportFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic activeUserRef;
  @override
  final dynamic createdAt;
  @override
  final String others;
  @override
  final dynamic postRef;
  final List<String> _reportContents;
  @override
  List<String> get reportContents {
    if (_reportContents is EqualUnmodifiableListView) return _reportContents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportContents);
  }

  @override
  String toString() {
    return 'PostReport(activeUid: $activeUid, activeUserRef: $activeUserRef, createdAt: $createdAt, others: $others, postRef: $postRef, reportContents: $reportContents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostReport &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality()
                .equals(other.activeUserRef, activeUserRef) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.others, others) || other.others == others) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            const DeepCollectionEquality()
                .equals(other._reportContents, _reportContents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(activeUserRef),
      const DeepCollectionEquality().hash(createdAt),
      others,
      const DeepCollectionEquality().hash(postRef),
      const DeepCollectionEquality().hash(_reportContents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostReportCopyWith<_$_PostReport> get copyWith =>
      __$$_PostReportCopyWithImpl<_$_PostReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostReportToJson(
      this,
    );
  }
}

abstract class _PostReport implements PostReport {
  const factory _PostReport(
      {required final String activeUid,
      required final dynamic activeUserRef,
      required final dynamic createdAt,
      required final String others,
      required final dynamic postRef,
      required final List<String> reportContents}) = _$_PostReport;

  factory _PostReport.fromJson(Map<String, dynamic> json) =
      _$_PostReport.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get activeUserRef;
  @override
  dynamic get createdAt;
  @override
  String get others;
  @override
  dynamic get postRef;
  @override
  List<String> get reportContents;
  @override
  @JsonKey(ignore: true)
  _$$_PostReportCopyWith<_$_PostReport> get copyWith =>
      throw _privateConstructorUsedError;
}
