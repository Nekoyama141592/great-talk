import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {},
          child: const Icon(Icons.new_label)),
    );
  }
}
