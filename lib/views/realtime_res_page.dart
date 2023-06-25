import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';

class RealtimeResPage extends StatelessWidget {
  const RealtimeResPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RealtimeResController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Obx(() => ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: ((context, index) {
                  if (index == controller.messages.indexOf(controller.messages.last) && controller.messages.last.isEmpty) {
                    return Obx(() => ListTile(title: Text(controller.realtimeRes.value),));
                  } else {
                    return Obx(() => ListTile(title: Text(controller.messages[index]),));
                  }
                }),
              ),)
            ),
            ElevatedButton(onPressed: controller.execute, child: const Text("実行"))
          ],
        )
      ),
    );
  }
}
