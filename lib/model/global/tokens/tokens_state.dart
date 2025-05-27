import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/database_schema/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/tokens/report_post_token/report_post_token.dart';

part 'tokens_state.freezed.dart';
part 'tokens_state.g.dart';

@freezed
abstract class TokensState with _$TokensState {
  const TokensState._();
  const factory TokensState({
    @Default(<FollowingToken>[]) List<FollowingToken> followingTokens,
    @Default(<LikePostToken>[]) List<LikePostToken> likePostTokens,
    @Default(<MutePostToken>[]) List<MutePostToken> mutePostTokens,
    @Default(<MuteUserToken>[]) List<MuteUserToken> muteUserTokens,
    @Default(<ReportPostToken>[]) List<ReportPostToken> reportPostTokens,
    @Default(<String>[]) List<String> deletePostIds,
  }) = _TokensState;
  factory TokensState.fromJson(Map<String, dynamic> json) =>
      _$TokensStateFromJson(json);
  List<String> get followingUids =>
      followingTokens.map((e) => e.passiveUid).toList();

  List<String> get likePostIds => likePostTokens.map((e) => e.postId).toList();

  List<String> get mutePostIds => mutePostTokens.map((e) => e.postId).toList();

  List<String> get muteUids => muteUserTokens.map((e) => e.passiveUid).toList();

  List<String> get reportPostIds =>
      reportPostTokens.map((e) => e.postId).toList();
  bool isDeletedPost(String postId) => deletePostIds.contains(postId);
  bool isMutingPost(String postId) => mutePostIds.contains(postId);
  bool isMutingUser(String uid) => muteUids.contains(uid);
}
