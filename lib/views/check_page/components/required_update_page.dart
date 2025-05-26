import 'package:flutter/material.dart';
import 'package:great_talk/ui_core/texts.dart';

class RequiredUpdatePage extends StatelessWidget {
  const RequiredUpdatePage({super.key, required this.forcedUpdateMsg});
  final String forcedUpdateMsg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: BasicBoldText(forcedUpdateMsg),
        ),
      ),
    );
  }
}
