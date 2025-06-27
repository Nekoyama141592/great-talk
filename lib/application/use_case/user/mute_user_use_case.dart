import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/domain/database_schema/post/post.dart';
import 'package:great_talk/domain/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/domain/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/repository/database_repository.dart';

class MuteUserUseCase {
  MuteUserUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  FutureResult<bool> muteUser(
    Post post,
    String currentUid,
    MuteUserToken token,
  ) {
    final passiveUid = post.uid;
    final userMute = UserMute.fromPost(currentUid, post);
    return firestoreRepository.createMuteUserInfo(
      currentUid,
      passiveUid,
      token,
      userMute,
    );
  }
}
