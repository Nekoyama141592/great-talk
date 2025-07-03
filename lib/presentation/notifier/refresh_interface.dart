import 'package:great_talk/infrastructure/model/result/result.dart';

abstract class RefreshInterface {
  FutureResult<bool> onLoading();
}
