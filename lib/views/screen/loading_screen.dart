import 'package:flutter/material.dart';
import 'package:great_talk/views/components/basic_height_box.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
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
