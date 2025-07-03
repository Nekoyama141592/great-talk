import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_user_token_entity/mute_user_token_entity.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/use_case_interface/user/i_mute_user_use_case.dart';

class MuteUserUseCase implements IMuteUserUseCase {
  MuteUserUseCase({required this.firestoreRepository});
  final DatabaseRepository firestoreRepository;

  @override
  FutureResult<bool> muteUser(
    PostEntity post,
    String currentUid,
    MuteUserTokenEntity token,
  ) {
    final passiveUid = post.uid;
    return firestoreRepository.createMuteUserInfo(currentUid, passiveUid);
  }
}
