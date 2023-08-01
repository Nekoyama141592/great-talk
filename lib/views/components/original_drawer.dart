import 'package:flutter/material.dart';

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
            onTap: () {},
          ),
          ListTile(
            title: const Text("ミュートしている投稿"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
