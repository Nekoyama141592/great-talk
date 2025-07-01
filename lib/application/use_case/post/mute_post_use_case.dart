import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
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
    PostEntity post,
    String currentUid,
    MutePostToken token,
  ) {
    final originalPost = Post.fromJson(post.toJson());
    final postMute = PostMute.fromPost(originalPost, currentUid);
    return firestoreRepository.createMutePostInfo(
      currentUid,
      post,
      token,
      postMute,
    );
  }
}
