// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModerationLabel {

 num get Confidence; String get Name; String get ParentName;
/// Create a copy of ModerationLabel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModerationLabelCopyWith<ModerationLabel> get copyWith => _$ModerationLabelCopyWithImpl<ModerationLabel>(this as ModerationLabel, _$identity);

  /// Serializes this ModerationLabel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModerationLabel&&(identical(other.Confidence, Confidence) || other.Confidence == Confidence)&&(identical(other.Name, Name) || other.Name == Name)&&(identical(other.ParentName, ParentName) || other.ParentName == ParentName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,Confidence,Name,ParentName);

@override
String toString() {
  return 'ModerationLabel(Confidence: $Confidence, Name: $Name, ParentName: $ParentName)';
}


}

/// @nodoc
abstract mixin class $ModerationLabelCopyWith<$Res>  {
  factory $ModerationLabelCopyWith(ModerationLabel value, $Res Function(ModerationLabel) _then) = _$ModerationLabelCopyWithImpl;
@useResult
$Res call({
 num Confidence, String Name, String ParentName
});




}
/// @nodoc
class _$ModerationLabelCopyWithImpl<$Res>
    implements $ModerationLabelCopyWith<$Res> {
  _$ModerationLabelCopyWithImpl(this._self, this._then);

  final ModerationLabel _self;
  final $Res Function(ModerationLabel) _then;

/// Create a copy of ModerationLabel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? Confidence = null,Object? Name = null,Object? ParentName = null,}) {
  return _then(_self.copyWith(
Confidence: null == Confidence ? _self.Confidence : Confidence // ignore: cast_nullable_to_non_nullable
as num,Name: null == Name ? _self.Name : Name // ignore: cast_nullable_to_non_nullable
as String,ParentName: null == ParentName ? _self.ParentName : ParentName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ModerationLabel implements ModerationLabel {
  const _ModerationLabel({required this.Confidence, required this.Name, required this.ParentName});
  factory _ModerationLabel.fromJson(Map<String, dynamic> json) => _$ModerationLabelFromJson(json);

@override final  num Confidence;
@override final  String Name;
@override final  String ParentName;

/// Create a copy of ModerationLabel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModerationLabelCopyWith<_ModerationLabel> get copyWith => __$ModerationLabelCopyWithImpl<_ModerationLabel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModerationLabelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModerationLabel&&(identical(other.Confidence, Confidence) || other.Confidence == Confidence)&&(identical(other.Name, Name) || other.Name == Name)&&(identical(other.ParentName, ParentName) || other.ParentName == ParentName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,Confidence,Name,ParentName);

@override
String toString() {
  return 'ModerationLabel(Confidence: $Confidence, Name: $Name, ParentName: $ParentName)';
}


}

/// @nodoc
abstract mixin class _$ModerationLabelCopyWith<$Res> implements $ModerationLabelCopyWith<$Res> {
  factory _$ModerationLabelCopyWith(_ModerationLabel value, $Res Function(_ModerationLabel) _then) = __$ModerationLabelCopyWithImpl;
@override @useResult
$Res call({
 num Confidence, String Name, String ParentName
});




}
/// @nodoc
class __$ModerationLabelCopyWithImpl<$Res>
    implements _$ModerationLabelCopyWith<$Res> {
  __$ModerationLabelCopyWithImpl(this._self, this._then);

  final _ModerationLabel _self;
  final $Res Function(_ModerationLabel) _then;

/// Create a copy of ModerationLabel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? Confidence = null,Object? Name = null,Object? ParentName = null,}) {
  return _then(_ModerationLabel(
Confidence: null == Confidence ? _self.Confidence : Confidence // ignore: cast_nullable_to_non_nullable
as num,Name: null == Name ? _self.Name : Name // ignore: cast_nullable_to_non_nullable
as String,ParentName: null == ParentName ? _self.ParentName : ParentName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
