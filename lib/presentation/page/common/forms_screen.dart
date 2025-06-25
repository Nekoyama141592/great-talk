import 'package:flutter/widgets.dart';
import 'package:great_talk/presentation/component/basic_page.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({
    super.key,
    required this.appBarText,
    required this.children,
  });
  final String appBarText;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return BasicPage(
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
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
