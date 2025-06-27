import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline.freezed.dart';
part 'timeline.g.dart';

@freezed
abstract class Timeline with _$Timeline {
  const factory Timeline({
    required dynamic createdAt,
    required bool isRead, // フォロワーが投稿を読んだかどうか
    required String posterUid,
    required String postId,
  }) = _Timeline;
  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}
