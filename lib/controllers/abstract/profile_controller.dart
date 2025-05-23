import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';

abstract class ProfileController extends DocsController {
  @override
  bool get requiresValueReset => true;
  final Rx<PublicUser?> rxPassiveUser = Rx(null);
  final Rx<Uint8List?> rxUint8list = Rx(null);

  @override
  void setQuery();

  String passiveUid();
}
