import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';

class UserProfileController extends DocsController {
  UserProfileController() : super(DocsType.userProfiles);
  @override
  Future<void> init() async {
    await getPassiveUser();
    return super.init();
  }

  
}
