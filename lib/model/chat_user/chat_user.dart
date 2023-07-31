import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

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
  factory ChatUser.fromJson(SDMap json) => _$ChatUserFromJson(json);
  factory ChatUser.fromFirestoreUser(FirestoreUser user) {
    return ChatUser(
        imageUrl: DetectedImage.fromJson(user.userImage).url,
        uid: user.uid,
        userName: DetectedText.fromJson(user.userName).value);
  }
  factory ChatUser.fromFirestoreUserMap(SDMap json) {
    final user = FirestoreUser.fromJson(json);
    return ChatUser(
        imageUrl: DetectedImage.fromJson(user.userImage).url,
        uid: user.uid,
        userName: DetectedText.fromJson(user.userName).value);
  }
}
