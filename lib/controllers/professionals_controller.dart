import 'package:get/get.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/persons_controller.dart';

class ProfessionalsController extends PersonsController {
  ProfessionalsController()
      : super(proPersons.obs, professionalsPrefsKey, proPersons);
  static ProfessionalsController get to => Get.find<ProfessionalsController>();
}
