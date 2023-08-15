import 'package:get/get.dart';

abstract class InitController extends GetxController {
  final isInit = false.obs;
  Future<void> init() async {
    if (isInit.value) {
      return;
    }
    await fetchData();
    isInit(true);
  }

  Future<void> fetchData() async {}
}
