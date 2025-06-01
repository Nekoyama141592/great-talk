import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/text_message/text_message.dart';
part 'chat_state.freezed.dart';
part 'chat_state.g.dart';

@freezed
abstract class ChatState with _$ChatState {
  const ChatState._();
  const factory ChatState({
    /// AIが応答を生成中かどうか
    @Default(false) bool isGenerating,

    /// チャットのメッセージリスト
    @Default([]) List<TextMessage> messages,
    required Post post,
    String? postImage,
    @Default(false) bool isPicked,
    String? pickedImage,
    @Default("") String realtimeRes,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}
