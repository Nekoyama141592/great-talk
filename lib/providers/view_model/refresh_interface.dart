import 'package:great_talk/repository/result/result.dart';

abstract class RefreshInterface {
  FutureResult<bool> onLoading();
}