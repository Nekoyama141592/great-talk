// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_object_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteObjectRequest {
  String get object;

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteObjectRequestCopyWith<DeleteObjectRequest> get copyWith =>
      _$DeleteObjectRequestCopyWithImpl<DeleteObjectRequest>(
          this as DeleteObjectRequest, _$identity);

  /// Serializes this DeleteObjectRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteObjectRequest &&
            (identical(other.object, object) || other.object == object));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, object);

  @override
  String toString() {
    return 'DeleteObjectRequest(object: $object)';
  }
}

/// @nodoc
abstract mixin class $DeleteObjectRequestCopyWith<$Res> {
  factory $DeleteObjectRequestCopyWith(
          DeleteObjectRequest value, $Res Function(DeleteObjectRequest) _then) =
      _$DeleteObjectRequestCopyWithImpl;
  @useResult
  $Res call({String object});
}

/// @nodoc
class _$DeleteObjectRequestCopyWithImpl<$Res>
    implements $DeleteObjectRequestCopyWith<$Res> {
  _$DeleteObjectRequestCopyWithImpl(this._self, this._then);

  final DeleteObjectRequest _self;
  final $Res Function(DeleteObjectRequest) _then;

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_self.copyWith(
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeleteObjectRequest extends DeleteObjectRequest {
  const _DeleteObjectRequest({required this.object}) : super._();
  factory _DeleteObjectRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteObjectRequestFromJson(json);

  @override
  final String object;

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteObjectRequestCopyWith<_DeleteObjectRequest> get copyWith =>
      __$DeleteObjectRequestCopyWithImpl<_DeleteObjectRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeleteObjectRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteObjectRequest &&
            (identical(other.object, object) || other.object == object));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, object);

  @override
  String toString() {
    return 'DeleteObjectRequest(object: $object)';
  }
}

/// @nodoc
abstract mixin class _$DeleteObjectRequestCopyWith<$Res>
    implements $DeleteObjectRequestCopyWith<$Res> {
  factory _$DeleteObjectRequestCopyWith(_DeleteObjectRequest value,
          $Res Function(_DeleteObjectRequest) _then) =
      __$DeleteObjectRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String object});
}

/// @nodoc
class __$DeleteObjectRequestCopyWithImpl<$Res>
    implements _$DeleteObjectRequestCopyWith<$Res> {
  __$DeleteObjectRequestCopyWithImpl(this._self, this._then);

  final _DeleteObjectRequest _self;
  final $Res Function(_DeleteObjectRequest) _then;

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? object = null,
  }) {
    return _then(_DeleteObjectRequest(
      object: null == object
          ? _self.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
