import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/basic_page.dart';
import 'package:great_talk/presentation/page/screen/loading_screen.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const BasicPage(child: LoadingScreen());
  }
}
