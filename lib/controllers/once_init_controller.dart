import 'package:get/get.dart';

abstract class OnceInitController extends GetxController {
  final isInit = false.obs;
  Future<void> onceInit() async {
    if (isInit.value) {
      return;
    }
    await fetchData();
    isInit(true);
  }

  Future<void> fetchData() async {}
}
