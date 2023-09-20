import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';

abstract class ProfileController extends DocsController {
  ProfileController(this.isMyProfile)
      : super(enablePullDown: true, requiresValueReset: !isMyProfile);
  final bool isMyProfile;
  final Rx<PublicUser?> passiveUser = Rx(null);
  final Rx<Uint8List?> uint8list = Rx(null);

  @override
  void setQuery();

  String passiveUid();
}
