import 'package:great_talk/presentation/constant/form_consts.dart';

class UserInfoValidator {
  static bool isInValidUser(String? bio, String? userName) {
    return _isInValidBio(bio) || _isInValidUserName(userName);
  }

  static bool _isInValidBio(String? bio) {
    return bio == null || bio.isEmpty || bio.length > FormConsts.maxBioLimit;
  }

  static bool _isInValidUserName(String? userName) {
    return userName == null ||
        userName.isEmpty ||
        userName.length > FormConsts.maxBioLimit;
  }
}
