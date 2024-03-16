import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:markdown/markdown.dart' as md;

const text = r'''
To confirm and express the statement, we will take the derivative of the function \(f(x) = \cos(6x)\) with respect to \(x\).

The derivative rule for \(f(x) = \cos(u)\), where \(u\) is a function of \(x\), is given by the chain rule: 
\[ \frac{d}{dx}[\cos(u)] = -\sin(u) \frac{du}{dx}. \]

For \(u = 6x\),
\[\frac{du}{dx} = 6.\]

Applying the derivative rule,
\[ \frac{d}{dx}[\cos(6x)] = -\sin(6x) \cdot 6. \]

Hence, you are correct. The derivative of \(\cos(6x)\) with respect to \(x\) is indeed \(-6 \sin(6x)\).
''';

class LatexText extends StatelessWidget {
  const LatexText({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectable = PurchasesController.to.isSubscribing();
      return MarkdownBody(
        selectable: selectable,
        data: "\ $data".replaceAll(r"\(", "\n\n" + r"\("),
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
