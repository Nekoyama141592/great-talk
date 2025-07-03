import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_user_token/mute_user_token.dart';

part 'tokens.freezed.dart';
part 'tokens.g.dart';

@freezed
abstract class Tokens with _$Tokens {
  const Tokens._();
  const factory Tokens({
    @Default(<FollowingToken>[]) List<FollowingToken> followingTokens,
    @Default(<LikePostToken>[]) List<LikePostToken> likePostTokens,
    @Default(<MutePostToken>[]) List<MutePostToken> mutePostTokens,
    @Default(<MuteUserToken>[]) List<MuteUserToken> muteUserTokens,
  }) = _Tokens;
  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  List<Map<String, dynamic>> get _allTokens {
    final List<Map<String, dynamic>> tokens = [];

    for (final token in followingTokens) {
      tokens.add({...token.toJson(), 'tokenType': 'following'});
    }

    for (final token in likePostTokens) {
      tokens.add({...token.toJson(), 'tokenType': 'likePost'});
    }

    for (final token in mutePostTokens) {
      tokens.add({...token.toJson(), 'tokenType': 'mutePost'});
    }

    for (final token in muteUserTokens) {
      tokens.add({...token.toJson(), 'tokenType': 'muteUser'});
    }

    return tokens;
  }

  bool get isNotEmpty => _allTokens.isNotEmpty;

  int get length => _allTokens.length;

  bool any(bool Function(Map<String, dynamic>) test) => _allTokens.any(test);

  Map<String, dynamic> firstWhere(
    bool Function(Map<String, dynamic>) test, {
    Map<String, dynamic> Function()? orElse,
  }) => _allTokens.firstWhere(test, orElse: orElse);
}
