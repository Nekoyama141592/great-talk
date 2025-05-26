import 'package:flutter/material.dart';
import 'package:great_talk/ui_core/texts.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key, required this.maintenanceMsg});
  final String maintenanceMsg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: BasicBoldText(maintenanceMsg),
        ),
      ),
    );
  }
}
