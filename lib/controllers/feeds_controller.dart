import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
class FeedsController extends DocsController {
  FeedsController() : super();
   @override
  DocsType get type => DocsType.feeds;
}
