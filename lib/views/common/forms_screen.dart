import 'package:flutter/widgets.dart';
import 'package:great_talk/views/components/basic_page.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen(
      {Key? key,
      required this.canPop,
      required this.appBarText,
      required this.children})
      : super(key: key);
  final bool canPop;
  final String appBarText;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: canPop,
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
