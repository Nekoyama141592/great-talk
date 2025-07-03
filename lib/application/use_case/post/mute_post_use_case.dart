import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_post_token_entity/mute_post_token_entity.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/use_case_interface/post/i_mute_post_use_case.dart';

class MutePostUseCase implements IMutePostUseCase {
  MutePostUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  @override
  FutureResult<bool> mutePost(
    PostEntity post,
    String currentUid,
    MutePostTokenEntity token,
  ) {
    return firestoreRepository.createMutePostInfo(
      currentUid,
      post.uid,
      post.postId,
    );
  }
}
