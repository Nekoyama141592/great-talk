import 'package:great_talk/controllers/abstract/docs_controller.dart';

abstract class ProfileController extends DocsController {
  @override
  bool get requiresValueReset => true;

  String passiveUid();
}
