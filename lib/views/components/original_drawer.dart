import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OriginalDrawer extends StatelessWidget {
  const OriginalDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          ListTile(
            title: const Text("アカウント情報"),
            onTap: () {},
          ),
          ListTile(
              title: const Text("ミュートしているユーザー"),
              onTap: () => Get.toNamed('/muteUsers')),
          ListTile(
              title: const Text("ミュートしている投稿"),
              onTap: () => Get.toNamed('/mutePosts')),
        ],
      ),
    );
  }
}
