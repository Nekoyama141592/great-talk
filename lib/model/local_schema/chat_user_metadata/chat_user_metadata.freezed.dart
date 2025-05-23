// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_user_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatUserMetadata {
  String? get lastAnswer;
  String? get description;

  /// Create a copy of ChatUserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatUserMetadataCopyWith<ChatUserMetadata> get copyWith =>
      _$ChatUserMetadataCopyWithImpl<ChatUserMetadata>(
          this as ChatUserMetadata, _$identity);

  /// Serializes this ChatUserMetadata to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatUserMetadata &&
            (identical(other.lastAnswer, lastAnswer) ||
                other.lastAnswer == lastAnswer) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastAnswer, description);

  @override
  String toString() {
    return 'ChatUserMetadata(lastAnswer: $lastAnswer, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ChatUserMetadataCopyWith<$Res> {
  factory $ChatUserMetadataCopyWith(
          ChatUserMetadata value, $Res Function(ChatUserMetadata) _then) =
      _$ChatUserMetadataCopyWithImpl;
  @useResult
  $Res call({String? lastAnswer, String? description});
}

/// @nodoc
class _$ChatUserMetadataCopyWithImpl<$Res>
    implements $ChatUserMetadataCopyWith<$Res> {
  _$ChatUserMetadataCopyWithImpl(this._self, this._then);

  final ChatUserMetadata _self;
  final $Res Function(ChatUserMetadata) _then;

  /// Create a copy of ChatUserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastAnswer = freezed,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      lastAnswer: freezed == lastAnswer
          ? _self.lastAnswer
          : lastAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatUserMetadata implements ChatUserMetadata {
  const _ChatUserMetadata({this.lastAnswer, this.description});
  factory _ChatUserMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChatUserMetadataFromJson(json);

  @override
  final String? lastAnswer;
  @override
  final String? description;

  /// Create a copy of ChatUserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatUserMetadataCopyWith<_ChatUserMetadata> get copyWith =>
      __$ChatUserMetadataCopyWithImpl<_ChatUserMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatUserMetadataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatUserMetadata &&
            (identical(other.lastAnswer, lastAnswer) ||
                other.lastAnswer == lastAnswer) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastAnswer, description);

  @override
  String toString() {
    return 'ChatUserMetadata(lastAnswer: $lastAnswer, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ChatUserMetadataCopyWith<$Res>
    implements $ChatUserMetadataCopyWith<$Res> {
  factory _$ChatUserMetadataCopyWith(
          _ChatUserMetadata value, $Res Function(_ChatUserMetadata) _then) =
      __$ChatUserMetadataCopyWithImpl;
  @override
  @useResult
  $Res call({String? lastAnswer, String? description});
}

/// @nodoc
class __$ChatUserMetadataCopyWithImpl<$Res>
    implements _$ChatUserMetadataCopyWith<$Res> {
  __$ChatUserMetadataCopyWithImpl(this._self, this._then);

  final _ChatUserMetadata _self;
  final $Res Function(_ChatUserMetadata) _then;

  /// Create a copy of ChatUserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastAnswer = freezed,
    Object? description = freezed,
  }) {
    return _then(_ChatUserMetadata(
      lastAnswer: freezed == lastAnswer
          ? _self.lastAnswer
          : lastAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
