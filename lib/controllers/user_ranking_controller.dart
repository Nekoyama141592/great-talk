import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';


class UserRankingController extends DocsController {
  @override
  DocsType get type => DocsType.rankingUsers;
}
