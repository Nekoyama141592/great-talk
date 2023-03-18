import 'package:get/get.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/persons_controller.dart';

class SearchController extends PersonsController {
  SearchController() : super(fullPersons.obs,localPersonsPrefsKey);
  static SearchController get to => Get.find<SearchController>();
}