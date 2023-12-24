import 'package:flutter/widgets.dart';
import 'package:great_talk/views/components/basic_page.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen(
      {Key? key,
      required this.onWillPop,
      required this.appBarText,
      required this.children})
      : super(key: key);
  final Future<bool> Function()? onWillPop;
  final String appBarText;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: BasicPage(
            appBarText: appBarText,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      // 水平パディング
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children),
                ),
              ),
            )));
  }
}
