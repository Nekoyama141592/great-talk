import 'package:flutter/material.dart';
import 'package:great_talk/views/components/profile_screen.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ProfileScreen(),
    );
  }
}
