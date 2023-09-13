import 'package:flutter/material.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/screen/refresh_screen/components/reload_screen/components/reload_button.dart';

class ReloadScreen extends StatelessWidget {
  const ReloadScreen({Key? key, required this.onReload, this.reloadMsg})
      : super(key: key);
  final void Function()? onReload;
  final String? reloadMsg;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: double.infinity,
      child: reloadMsg == null
          ? ReloadButton(onReload: onReload)
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReloadButton(onReload: onReload),
                  const BasicHeightBox(),
                  BasicBoldText(reloadMsg!)
                ],
              ),
            ),
    );
  }
}
