import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_user.freezed.dart';
part 'chat_user.g.dart';

@freezed
abstract class ChatUser with _$ChatUser {
  const factory ChatUser({
    required String imageUrl,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    required String uid,
    required String userName,
  }) = _ChatUser;
  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
}
