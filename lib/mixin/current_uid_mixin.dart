import 'package:great_talk/controllers/current_user_controller.dart';

mixin CurrentUidMixin {
  String currentUid() => CurrentUserController.to.currentUid();
}
