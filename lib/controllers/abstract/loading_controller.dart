import 'package:get/get.dart';

class LoadingController extends GetxController {
  final isLoading = false.obs;
  bool cannotShow() => isLoading.value;
  void startLoading() => isLoading(true);
  void endLoading() => isLoading(false);
}
