// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatContent _$ChatContentFromJson(Map<String, dynamic> json) {
  return _ChatContent.fromJson(json);
}

/// @nodoc
mixin _$ChatContent {
  String get contentId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int? get lastSeen => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String get posterUid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatContentCopyWith<ChatContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatContentCopyWith<$Res> {
  factory $ChatContentCopyWith(
          ChatContent value, $Res Function(ChatContent) then) =
      _$ChatContentCopyWithImpl<$Res, ChatContent>;
  @useResult
  $Res call(
      {String contentId,
      String imageUrl,
      int? lastSeen,
      Map<String, dynamic>? metadata,
      String posterUid,
      String userName});
}

/// @nodoc
class _$ChatContentCopyWithImpl<$Res, $Val extends ChatContent>
    implements $ChatContentCopyWith<$Res> {
  _$ChatContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? imageUrl = null,
    Object? lastSeen = freezed,
    Object? metadata = freezed,
    Object? posterUid = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      posterUid: null == posterUid
          ? _value.posterUid
          : posterUid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatContentCopyWith<$Res>
    implements $ChatContentCopyWith<$Res> {
  factory _$$_ChatContentCopyWith(
          _$_ChatContent value, $Res Function(_$_ChatContent) then) =
      __$$_ChatContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contentId,
      String imageUrl,
      int? lastSeen,
      Map<String, dynamic>? metadata,
      String posterUid,
      String userName});
}

/// @nodoc
class __$$_ChatContentCopyWithImpl<$Res>
    extends _$ChatContentCopyWithImpl<$Res, _$_ChatContent>
    implements _$$_ChatContentCopyWith<$Res> {
  __$$_ChatContentCopyWithImpl(
      _$_ChatContent _value, $Res Function(_$_ChatContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? imageUrl = null,
    Object? lastSeen = freezed,
    Object? metadata = freezed,
    Object? posterUid = null,
    Object? userName = null,
  }) {
    return _then(_$_ChatContent(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      posterUid: null == posterUid
          ? _value.posterUid
          : posterUid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatContent implements _ChatContent {
  const _$_ChatContent(
      {required this.contentId,
      required this.imageUrl,
      this.lastSeen,
      final Map<String, dynamic>? metadata,
      required this.posterUid,
      required this.userName})
      : _metadata = metadata;

  factory _$_ChatContent.fromJson(Map<String, dynamic> json) =>
      _$$_ChatContentFromJson(json);

  @override
  final String contentId;
  @override
  final String imageUrl;
  @override
  final int? lastSeen;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String posterUid;
  @override
  final String userName;

  @override
  String toString() {
    return 'ChatContent(contentId: $contentId, imageUrl: $imageUrl, lastSeen: $lastSeen, metadata: $metadata, posterUid: $posterUid, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatContent &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.posterUid, posterUid) ||
                other.posterUid == posterUid) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentId, imageUrl, lastSeen,
      const DeepCollectionEquality().hash(_metadata), posterUid, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatContentCopyWith<_$_ChatContent> get copyWith =>
      __$$_ChatContentCopyWithImpl<_$_ChatContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatContentToJson(
      this,
    );
  }
}

abstract class _ChatContent implements ChatContent {
  const factory _ChatContent(
      {required final String contentId,
      required final String imageUrl,
      final int? lastSeen,
      final Map<String, dynamic>? metadata,
      required final String posterUid,
      required final String userName}) = _$_ChatContent;

  factory _ChatContent.fromJson(Map<String, dynamic> json) =
      _$_ChatContent.fromJson;

  @override
  String get contentId;
  @override
  String get imageUrl;
  @override
  int? get lastSeen;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String get posterUid;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$_ChatContentCopyWith<_$_ChatContent> get copyWith =>
      throw _privateConstructorUsedError;
}
