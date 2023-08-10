import 'package:flutter/material.dart';
import 'package:great_talk/views/screen/loading_screen.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoadingScreen());
  }
}
