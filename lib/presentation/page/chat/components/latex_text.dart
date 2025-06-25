import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class LatexText extends StatelessWidget {
  const LatexText({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return GptMarkdown(data, style: const TextStyle(color: Colors.white));
  }
}
