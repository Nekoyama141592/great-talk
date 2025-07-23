import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_model.freezed.dart';
part 'timeline_model.g.dart';

@freezed
abstract class TimelineModel with _$TimelineModel {
  const factory TimelineModel({
    required dynamic createdAt,
    required bool isRead, // フォロワーが投稿を読んだかどうか
    required String posterUid,
    required String postId,
  }) = _TimelineModel;
  factory TimelineModel.fromJson(Map<String, dynamic> json) =>
      _$TimelineModelFromJson(json);
}
