import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/database_schema/post/post.dart';
import 'package:great_talk/domain/database_schema/timeline/timeline.dart';
import 'package:great_talk/model/view_model_state/common/user_post/user_post.dart';

part 'timelines_state.freezed.dart';
part 'timelines_state.g.dart';

@freezed
abstract class TimelinesState with _$TimelinesState {
  const TimelinesState._();
  const factory TimelinesState({
    @Default([]) List<UserPost> userPosts,
    @Default([]) List<Timeline> timelines,
  }) = _TimelinesState;
  factory TimelinesState.fromJson(Map<String, dynamic> json) =>
      _$TimelinesStateFromJson(json);
  List<Post> posts() => userPosts.map((e) => e.post).toList();
}
