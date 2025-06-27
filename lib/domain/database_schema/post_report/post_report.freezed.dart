// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostReport {

 String get activeUid; dynamic get activeUserRef; dynamic get createdAt; String get others; dynamic get postRef; List<String> get reportContents;
/// Create a copy of PostReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostReportCopyWith<PostReport> get copyWith => _$PostReportCopyWithImpl<PostReport>(this as PostReport, _$identity);

  /// Serializes this PostReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostReport&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.activeUserRef, activeUserRef)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.others, others) || other.others == others)&&const DeepCollectionEquality().equals(other.postRef, postRef)&&const DeepCollectionEquality().equals(other.reportContents, reportContents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(activeUserRef),const DeepCollectionEquality().hash(createdAt),others,const DeepCollectionEquality().hash(postRef),const DeepCollectionEquality().hash(reportContents));

@override
String toString() {
  return 'PostReport(activeUid: $activeUid, activeUserRef: $activeUserRef, createdAt: $createdAt, others: $others, postRef: $postRef, reportContents: $reportContents)';
}


}

/// @nodoc
abstract mixin class $PostReportCopyWith<$Res>  {
  factory $PostReportCopyWith(PostReport value, $Res Function(PostReport) _then) = _$PostReportCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic activeUserRef, dynamic createdAt, String others, dynamic postRef, List<String> reportContents
});




}
/// @nodoc
class _$PostReportCopyWithImpl<$Res>
    implements $PostReportCopyWith<$Res> {
  _$PostReportCopyWithImpl(this._self, this._then);

  final PostReport _self;
  final $Res Function(PostReport) _then;

/// Create a copy of PostReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? activeUserRef = freezed,Object? createdAt = freezed,Object? others = null,Object? postRef = freezed,Object? reportContents = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,activeUserRef: freezed == activeUserRef ? _self.activeUserRef : activeUserRef // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,others: null == others ? _self.others : others // ignore: cast_nullable_to_non_nullable
as String,postRef: freezed == postRef ? _self.postRef : postRef // ignore: cast_nullable_to_non_nullable
as dynamic,reportContents: null == reportContents ? _self.reportContents : reportContents // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostReport implements PostReport {
  const _PostReport({required this.activeUid, required this.activeUserRef, required this.createdAt, required this.others, required this.postRef, required final  List<String> reportContents}): _reportContents = reportContents;
  factory _PostReport.fromJson(Map<String, dynamic> json) => _$PostReportFromJson(json);

@override final  String activeUid;
@override final  dynamic activeUserRef;
@override final  dynamic createdAt;
@override final  String others;
@override final  dynamic postRef;
 final  List<String> _reportContents;
@override List<String> get reportContents {
  if (_reportContents is EqualUnmodifiableListView) return _reportContents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reportContents);
}


/// Create a copy of PostReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostReportCopyWith<_PostReport> get copyWith => __$PostReportCopyWithImpl<_PostReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostReport&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.activeUserRef, activeUserRef)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.others, others) || other.others == others)&&const DeepCollectionEquality().equals(other.postRef, postRef)&&const DeepCollectionEquality().equals(other._reportContents, _reportContents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(activeUserRef),const DeepCollectionEquality().hash(createdAt),others,const DeepCollectionEquality().hash(postRef),const DeepCollectionEquality().hash(_reportContents));

@override
String toString() {
  return 'PostReport(activeUid: $activeUid, activeUserRef: $activeUserRef, createdAt: $createdAt, others: $others, postRef: $postRef, reportContents: $reportContents)';
}


}

/// @nodoc
abstract mixin class _$PostReportCopyWith<$Res> implements $PostReportCopyWith<$Res> {
  factory _$PostReportCopyWith(_PostReport value, $Res Function(_PostReport) _then) = __$PostReportCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic activeUserRef, dynamic createdAt, String others, dynamic postRef, List<String> reportContents
});




}
/// @nodoc
class __$PostReportCopyWithImpl<$Res>
    implements _$PostReportCopyWith<$Res> {
  __$PostReportCopyWithImpl(this._self, this._then);

  final _PostReport _self;
  final $Res Function(_PostReport) _then;

/// Create a copy of PostReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? activeUserRef = freezed,Object? createdAt = freezed,Object? others = null,Object? postRef = freezed,Object? reportContents = null,}) {
  return _then(_PostReport(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,activeUserRef: freezed == activeUserRef ? _self.activeUserRef : activeUserRef // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,others: null == others ? _self.others : others // ignore: cast_nullable_to_non_nullable
as String,postRef: freezed == postRef ? _self.postRef : postRef // ignore: cast_nullable_to_non_nullable
as dynamic,reportContents: null == reportContents ? _self._reportContents : reportContents // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
