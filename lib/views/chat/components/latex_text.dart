import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:markdown/markdown.dart' as md;

class LatexText extends StatelessWidget {
  const LatexText({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectable = PurchasesController.to.isSubscribing();
      return MarkdownBody(
        selectable: selectable,
        data: "\ $data",
        builders: {
          'latex': LatexElementBuilder(),
        },
        extensionSet: md.ExtensionSet(
          [LatexBlockSyntax()],
          [LatexInlineSyntax()],
        ),
      );
    });
  }
}
