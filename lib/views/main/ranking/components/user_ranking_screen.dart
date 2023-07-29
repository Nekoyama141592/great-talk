import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/user_ranking_controller.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/views/components/refresh_screen.dart';

class UserRankingScreen extends HookWidget {
  const UserRankingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserRankingController());
    useEffect(() {
      controller.init();
      return;
    }, []);
    return Obx(() => RefreshScreen(
        docsController: controller,
        child: ListView.builder(
            itemCount: controller.docs.length,
            itemBuilder: (c, i) {
              final user = FirestoreUser.fromJson(controller.docs[i].data());
              return Text(user.userName.value);
            })));
  }
}
