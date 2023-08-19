import 'package:flutter/material.dart';

abstract class ProcessingState<T extends StatefulWidget> extends State<T> {
  bool isProcessing = false; // 二重リクエストを予防する変数.
  // UIを変更するわけではないので、setState()は不要.
  void startProcess() => isProcessing = true;
  void endProcess() => isProcessing = false;
}
