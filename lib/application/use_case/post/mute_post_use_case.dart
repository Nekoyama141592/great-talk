import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/infrastructure/model/database_schema/post_mute/post_mute.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/use_case_interface/post/i_mute_post_use_case.dart';

class MutePostUseCase implements IMutePostUseCase {
  MutePostUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  @override
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
