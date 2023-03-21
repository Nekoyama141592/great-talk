// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_user_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatUserMetadata _$ChatUserMetadataFromJson(Map<String, dynamic> json) {
  return _ChatUserMetadata.fromJson(json);
}

/// @nodoc
mixin _$ChatUserMetadata {
  String get lastAnswer => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatUserMetadataCopyWith<ChatUserMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUserMetadataCopyWith<$Res> {
  factory $ChatUserMetadataCopyWith(
          ChatUserMetadata value, $Res Function(ChatUserMetadata) then) =
      _$ChatUserMetadataCopyWithImpl<$Res, ChatUserMetadata>;
  @useResult
  $Res call({String lastAnswer, String? description});
}

/// @nodoc
class _$ChatUserMetadataCopyWithImpl<$Res, $Val extends ChatUserMetadata>
    implements $ChatUserMetadataCopyWith<$Res> {
  _$ChatUserMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastAnswer = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      lastAnswer: null == lastAnswer
          ? _value.lastAnswer
          : lastAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatUserMetadataCopyWith<$Res>
    implements $ChatUserMetadataCopyWith<$Res> {
  factory _$$_ChatUserMetadataCopyWith(
          _$_ChatUserMetadata value, $Res Function(_$_ChatUserMetadata) then) =
      __$$_ChatUserMetadataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lastAnswer, String? description});
}

/// @nodoc
class __$$_ChatUserMetadataCopyWithImpl<$Res>
    extends _$ChatUserMetadataCopyWithImpl<$Res, _$_ChatUserMetadata>
    implements _$$_ChatUserMetadataCopyWith<$Res> {
  __$$_ChatUserMetadataCopyWithImpl(
      _$_ChatUserMetadata _value, $Res Function(_$_ChatUserMetadata) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastAnswer = null,
    Object? description = freezed,
  }) {
    return _then(_$_ChatUserMetadata(
      lastAnswer: null == lastAnswer
          ? _value.lastAnswer
          : lastAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatUserMetadata implements _ChatUserMetadata {
  const _$_ChatUserMetadata({required this.lastAnswer, this.description});

  factory _$_ChatUserMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_ChatUserMetadataFromJson(json);

  @override
  final String lastAnswer;
  @override
  final String? description;

  @override
  String toString() {
    return 'ChatUserMetadata(lastAnswer: $lastAnswer, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatUserMetadata &&
            (identical(other.lastAnswer, lastAnswer) ||
                other.lastAnswer == lastAnswer) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastAnswer, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatUserMetadataCopyWith<_$_ChatUserMetadata> get copyWith =>
      __$$_ChatUserMetadataCopyWithImpl<_$_ChatUserMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatUserMetadataToJson(
      this,
    );
  }
}

abstract class _ChatUserMetadata implements ChatUserMetadata {
  const factory _ChatUserMetadata(
      {required final String lastAnswer,
      final String? description}) = _$_ChatUserMetadata;

  factory _ChatUserMetadata.fromJson(Map<String, dynamic> json) =
      _$_ChatUserMetadata.fromJson;

  @override
  String get lastAnswer;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_ChatUserMetadataCopyWith<_$_ChatUserMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
