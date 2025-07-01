import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/use_case_interface/user/i_mute_user_use_case.dart';

class MuteUserUseCase implements IMuteUserUseCase {
  MuteUserUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  @override
  FutureResult<bool> muteUser(
    PostEntity post,
    String currentUid,
    MuteUserToken token,
  ) {
    final passiveUid = post.uid;
    final originalPost = Post.fromJson(post.toJson());
    final userMute = UserMute.fromPost(currentUid, originalPost);
    return firestoreRepository.createMuteUserInfo(
      currentUid,
      passiveUid,
      token,
      userMute,
    );
  }
}
