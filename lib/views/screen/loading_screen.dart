import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:great_talk/views/components/basic_height_box.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
            width: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
          BasicHeightBox(),
          Text("ロード中...")
        ],
      ),
    );
  }
}
