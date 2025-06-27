import 'package:great_talk/infrastructure/repository/result/result.dart';

abstract class RefreshInterface {
  FutureResult<bool> onLoading();
}
