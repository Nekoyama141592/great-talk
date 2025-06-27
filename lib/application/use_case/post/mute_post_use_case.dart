import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/post_mute/post_mute.dart';
import 'package:great_talk/domain/entity/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/repository/database_repository.dart';

class MutePostUseCase {
  MutePostUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  FutureResult<bool> mutePost(
    Post post,
    String currentUid,
    MutePostToken token,
  ) {
    final postMute = PostMute.fromPost(post, currentUid);
    return firestoreRepository.createMutePostInfo(
      currentUid,
      post,
      token,
      postMute,
    );
  }
}
